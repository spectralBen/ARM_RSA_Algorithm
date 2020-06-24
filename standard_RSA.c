#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <math.h>
#include <stdint.h>
#include <stdbool.h>
#include <time.h>

typedef struct Primes Primes;
typedef struct Pub Pub;
typedef struct Enc Enc;
typedef struct Dec dec;
typedef struct Tot Tot;


struct Primes{

	int32_t p;
	int32_t q;
};

struct Pub{

	int64_t pk;
};

struct Enc{

	int32_t ek;
	int32_t et;
};

struct Dec{

	int32_t dk;
};

struct Tot{

	uint32_t et;
};

int gcd(int32_t a, int32_t b){

	int i, gcd;
	for(i = 1; i <= a && i <= b; ++i) {
		if(a % i == 0 && b % i == 0) {gcd = i;}
	}
	return gcd;
}

bool relativePrimes(int32_t a, int32_t b){
	// Check if prime pair is relatively prime
	// GCD should be 1
	if (gcd(a,b) == 1) return 1;
	return 0;
}

bool prime(int16_t a){
	// check if prime
	for(int i = 2; i < a/2; i++){
		if( a%i == 0 && a != 0) return 0;
	}
	return 1;
}

void generatePrimes(Primes* primes){
	// Generate a pair of prime numbers 
	do{	primes -> p = rand() % 32767;	}while(!prime(primes->p));
	do{	primes -> q = rand() % 32767;	}while(!prime(primes->q));
	return;
}

void generatePublicKey(Primes primes, Pub* pub){

	pub->pk = primes.p * primes.q;

}

void generateEncryptionKey(Enc* enc){

	do{	enc->ek = rand() % 32767;	}while(!prime(enc->ek));
}

void generateDecryptionKey(){

}

int main(int argc, char* argv[]){

	//Variables
	Primes primes;
	Pub pub;
	Enc enc;
	Dec dec;
	Tot tot;
	time_t t;
	

	// Time seed
	srand((unsigned) time(&t));

	// Generate two primes
	generatePrimes(&primes);
	printf("P is:\t%d\nQ is:\t%d\n\n",primes.p, primes.q);

	// Generate public key
	generatePublicKey(primes, &pub);
	printf("Public key is:\t%ld\n",pub.pk);
	
	// Create Eulers Totient with primes
	enc.et = (primes.p-1)*(primes.q-1);

	// Create the encryption keys
	do{	generateEncryptionKey(&enc); }while(!relativePrimes(enc.ek, enc.et) && !(enc.ek > 1));
	printf("Encryption key is:\t%d\n",enc.ek);
}





