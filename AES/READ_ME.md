# VHDL Implementation of AES-128: Encryption and Decryption

## What is AES?

The Advanced Encryption Standard (AES) is a cryptographic algorithm used to encrypt and decrypt information. An encryption algorithm transforms the **plaintext** (original data before encryption) into a **ciphertext** (an unintelligble form of data), which can only be accessed using a **cipher key**. In the AES algorithm, the encryption and decryption stages use the same cipher key because it is a symmetric block cipher. For this implementation, both the length of the data input and the cipher key are set to 128 bits.

#### Round:

The AES algorithm uses a series of iterations to encrypt the plaintext into a ciphertext (and vice versa). These are known as rounds. The next stage of the AES algorithm is determined by the output of the previous round. For each round, there are 4 unique transformations: Sub-byte, Shift row, Mix Column and Add Round Key. A brief explanation of these can be seen below:

- Sub-Byte: Each byte of data is substitured with a byte from a fixed lookup table, the Sbox.

- Shift Row: Each row of the input is rotated by an incrementing number of bytes.

- Mix Column: Each column of the input is multiplied in Rijindael's Galois Field by a given matrix.

- Add Round Key: The input is XOR-ed with a unique round key. The Key Schedule is used to expand the cipher key to generate seperate round keys, which are needed to perform this function.

#### Encryption:

#### Decryption:



### Useful links:

- FIPS (Federal Information Processing Standard) 197 can be found [here](https://nvlpubs.nist.gov/nistpubs/FIPS/NIST.FIPS.197.pdf)

- AES-128 Encryption explained as a [flash animation](https://formaestudio.com/rijndaelinspector/archivos/Rijndael_Animation_v4_eng-html5.html) (a version on youtube is available [here](https://www.youtube.com/watch?v=gP4PqVGudtg&t=48s))

- The AES Mixed Columns Operation is explained [here](https://www.angelfire.com/biz7/atleast/mix_columns.pdf)