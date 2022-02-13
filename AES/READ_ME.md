# VHDL Implementation of AES-128: Encryption and Decryption

## What is AES?

The Advanced Encryption Standard (AES) is a cryptographic algorithm used to encrypt and decrypt information. An encryption algorithm transforms the **plaintext** (original data before encryption) into a **ciphertext** (an unintelligble form of data), which can only be accessed using a **cipher key**. In the AES algorithm, the encryption and decryption stages use the same cipher key because it is a symmetric block cipher. For this implementation, both the length of the data input and the cipher key are set to 128 bits.

## Encryption:

The AES algorithm uses a series of iterations to encrypt the plaintext into a ciphertext. These are known as rounds. The next stage of the AES algorithm is determined by the output of the previous round. Descriptions of the various rounds can be seen below:

#### Initial Round:

The Initial round is the Add Round Key only, and takes the plaintext and ciphertext as inputs. The output of the initial round is mapped to the input of the first main round.

#### Main Round:

For each main round, there are 4 unique transformations: Sub-byte, Shift row, Mix Column and Add Round Key. A brief explanation of these can be seen below:

- Sub Bytes: Each byte of data is substituted with a byte from a fixed lookup table, the Sbox.

- Shift Rows: Each row of the input is rotated by an incrementing number of bytes.

- Mix Columns: Each column of the input is multiplied in Rijindael's Galois Field by the following matrix:

| 02 03 01 01 |
| 01 02 03 01 |
| 01 01 02 03 |
| 03 01 01 02 |

- Add Round Key: The input is XOR-ed with a unique round key. The Key Schedule is used to expand the cipher key to generate seperate round keys, which are needed to perform this function.

#### Final Round:

The Final Round consists of the Sub Bytes, Shift Rows and Add Round Key operations. The Final Round outputs the Ciphertext.

#### Block Diagram:

![Encryption Block Diagram:](docs/diagrams/encryption.png)

## Decryption:

This process decrypts the ciphertext back into its original plaintext. Descriptions of the various rounds used during Decryption can be seen below:

#### Inverse Initial Round:

Similar to Encryption, the Initial Round is the Add Round Key operation only.

#### Inverse Main Round:

The Inverse Main Round uses the inverse of the transformations in the Encryption process. A brief explanation of these can be seen below:

- Inverse Sub Bytes: Each byte of data is substituted with a byte from a fixed lookup table, the Inverse Sbox.

- Inverse Shift Rows: Each row of the input is rotated by an incrementing number of bytes.

- Inverse Mix Columns: Each column of the input is multiplied in Rijindael's Galois Field by the following matrix:

| 0E 0B 0D 09 |
| 09 0E 0B 0D |
| 0D 09 0E 0B |
| 0B 0D 09 0E |

- Add Round Key: The input is XOR-ed with a unique round key. The Key Schedule is used to expand the cipher key to generate seperate round keys, which are needed to perform this function.

![Decryption Block Diagram:](docs/diagrams/decryption.png)

### Useful links:

- FIPS (Federal Information Processing Standard) 197 can be found [here](https://nvlpubs.nist.gov/nistpubs/FIPS/NIST.FIPS.197.pdf)

- AES-128 Encryption explained as a [flash animation](https://formaestudio.com/rijndaelinspector/archivos/Rijndael_Animation_v4_eng-html5.html) (a version on youtube is available [here](https://www.youtube.com/watch?v=gP4PqVGudtg&t=48s))

- The AES Mixed Columns Operation is explained [here](https://www.angelfire.com/biz7/atleast/mix_columns.pdf)