<h1>ARM_RSA_Algorithm</h1>
This project is the creation of a side-channel resistant RSA algorithm.
The power spectrum consumed by the code should be independent of user-input (private key decryption).

<h2>standard_RSA.c</h2>
The naive implementation of the RSA algorithm, created without attempts to mask the power spectrum.
The assembly (.s) control flow will be traced to follow control flow and analyse power spectrum. 

<h2>resources.c</h2>
File used for testing modules of code independently. 

<h2>Target</h2>
The target architecture is ARMv7, and the current development board is the beaglebone black wireless.
