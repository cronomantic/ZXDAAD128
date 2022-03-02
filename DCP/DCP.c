/*
 * (c) Copyright 2021 by Einar Saukas. All rights reserved.
 *     Modifications by Cronomantic.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *     * Redistributions of source code must retain the above copyright
 *       notice, this list of conditions and the following disclaimer.
 *     * Redistributions in binary form must reproduce the above copyright
 *       notice, this list of conditions and the following disclaimer in the
 *       documentation and/or other materials provided with the distribution.
 *     * The name of its author may not be used to endorse or promote products
 *       derived from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
 * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL <COPYRIGHT HOLDER> BE LIABLE FOR ANY
 * DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
 * ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>
#include <stdbool.h>

#include "zx0.h"

#define MAX_OFFSET_ZX0 32640
#define MAX_SIZE 6912
#define SECTOR1 2048
#define ATTRIB1 768

unsigned char input_data[MAX_SIZE + 1];
unsigned char screen_data[(MAX_SIZE - ATTRIB1)];
unsigned char att_data[ATTRIB1];

void convert()
{
    int sector;
    int row;
    int lin;
    int col;
    int i, j;

    i = 0;
    j = 0;

    /* transform bitmap area */
    for (sector = 0; sector < MAX_SIZE / SECTOR1; sector++)
    {
        for (col = 0; col < 32; col++)
        {
            for (row = 0; row < 8; row++)
            {
                for (lin = 0; lin < 8; lin++)
                {
                    screen_data[i++] = input_data[(((((sector << 3) + lin) << 3) + row) << 5) + col];
                }
            }
        }
    }

    /* just copy attributes */
    for (; i < MAX_SIZE; i++)
    {
        att_data[j++] = input_data[i];
    }
}

bool is_little_endian()
{
    short int number = 0x1;
    char *numPtr = (char *)&number;
    return (numPtr[0] == 1);
}

uint16_t swap_uint16(uint16_t val)
{
    return (val << 8) | (val >> 8);
}

void strip_ext(char *fname)
{
    char *end = fname + strlen(fname);

    while (end > fname && *end != '.' && *end != '\\' && *end != '/')
    {
        --end;
    }
    if ((end > fname && *end == '.') &&
        (*(end - 1) != '\\' && *(end - 1) != '/'))
    {
        *end = '\0';
    }
}

int main(int argc, char *argv[])
{
    unsigned char *output_data_scr;
    unsigned char *output_data_att;
    size_t input_size;
    size_t bytes_read;
    int output_size_scr;
    int output_size_att;
    uint16_t scr_size;
    uint16_t att_size;
    int forced_mode = FALSE;
    char *input_name = NULL;
    char *output_name = NULL;
    FILE *ifp;
    FILE *ofp;
    int delta_scr;
    int delta_att;
    int i;

    printf("DCP v0.1: Daad Picture Compressor by Cronomantic\n");
    printf("          Based on ZX0 v2.2 by Einar Saukas\n\n");

    for (i = 1; i < argc; i++)
    {
        if (!strcmp(argv[i], "-f"))
        {
            forced_mode = 1;
        }
        else if (input_name == NULL)
        {
            input_name = argv[i];
        }
        else if (output_name == NULL)
        {
            output_name = argv[i];
        }
        else
        {
            input_name = NULL;
            break;
        }
    }

    /* validate command-line arguments */
    if (input_name == NULL)
    {
        fprintf(stderr, "Usage: %s [-f] input [output]\n"
                        "  -f      Force overwrite of output file\n",
                argv[0]);
        exit(1);
    }
    if (output_name == NULL)
    {
        output_name = (char *)malloc(strlen(input_name) + 5);
        strcpy(output_name, input_name);
        strip_ext(output_name);
        strcat(output_name, ".DCP");
    }

    /* open input file */
    ifp = fopen(input_name, "rb");
    if (!ifp)
    {
        fprintf(stderr, "Error: Cannot access input file %s\n", input_name);
        exit(1);
    }

    /* read input file */
    input_size = 0;
    while ((bytes_read = fread(input_data + input_size, sizeof(char), ((MAX_SIZE + 1) - input_size), ifp)) > 0)
    {
        input_size += bytes_read;
    }

    /* close input file */
    fclose(ifp);

    if (input_size == MAX_SIZE)
    {
        printf("Converting screen data...\n");
        convert();
    }
    else
    {
        fprintf(stderr, "Error: Invalid input file %s\n", input_name);
        exit(1);
    }

    /* check output file */
    if (!forced_mode && fopen(output_name, "rb") != NULL)
    {
        fprintf(stderr, "Error: Already existing output file %s\n", output_name);
        exit(1);
    }

    /* create output file */
    ofp = fopen(output_name, "wb");
    if (!ofp)
    {
        fprintf(stderr, "Error: Cannot create output file %s\n", output_name);
        exit(1);
    }

    /* generate output file */
    output_data_scr = compress(optimize(&(screen_data[0]), (MAX_SIZE - ATTRIB1), 0, MAX_OFFSET_ZX0), &(screen_data[0]), (MAX_SIZE - ATTRIB1), 0, FALSE, TRUE, &output_size_scr, &delta_scr);
    printf("Pixel data compressed from %d to %d bytes! (delta %d)\n", (MAX_SIZE - ATTRIB1), output_size_scr, delta_scr);

    output_data_att = compress(optimize(&(att_data[0]), ATTRIB1, 0, MAX_OFFSET_ZX0), &(att_data[0]), ATTRIB1, 0, FALSE, TRUE, &output_size_att, &delta_att);
    printf("Atributtes compressed from %d to %d bytes! (delta %d)\n", ATTRIB1, output_size_att, delta_att);

    scr_size = (uint16_t)output_size_scr;
    att_size = (uint16_t)output_size_att;

    if (!is_little_endian())
    {
        scr_size = swap_uint16(scr_size);
        att_size = swap_uint16(att_size);
    }

    if (fwrite(&scr_size, sizeof(char), 2, ofp) != 2)
    {
        fprintf(stderr, "Error: Cannot write output file %s\n", output_name);
        exit(1);
    }

    if (fwrite(&att_size, sizeof(char), 2, ofp) != 2)
    {
        fprintf(stderr, "Error: Cannot write output file %s\n", output_name);
        exit(1);
    }

    /* write output file */
    if (fwrite(output_data_scr, sizeof(char), output_size_scr, ofp) != output_size_scr)
    {
        fprintf(stderr, "Error: Cannot write output file %s\n", output_name);
        exit(1);
    }

    /* write output file */
    if (fwrite(output_data_att, sizeof(char), output_size_att, ofp) != output_size_att)
    {
        fprintf(stderr, "Error: Cannot write output file %s\n", output_name);
        exit(1);
    }

    /* close output file */
    fclose(ofp);

    /* done! */
    printf("Done!\n");

    return 0;
}
