#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <math.h>

int gcd(int a, int b);
int primarity(int a, int i);
int findT(int a, int m, int n);
void exp_f(int bit, int n, int* y, int* a);
int inverse(int a, int b);
void encrypt(int value, FILE* out);
void decrypt(int value, FILE* out);
int generateKeys();

int e, d, n; //global variables

int gcd(int a, int b){
	int q, r1, r2, r;
	if (a > b){
		r1 = a;
		r2 = b;
	}
	else{
		r1 = b;
		r2 = a;
	}	
	while (r2 > 0){
		q = r1 / r2;
		r = r1 - q * r2;
		r1 = r2;
		r2 = r;
	}
	return r1;
}

int primarity(int a, int i){
	
	int n = i - 1;
	int k = 0;
	int j, m, T;

	while (n % 2 == 0){
		k++;
		n = n / 2;
	}

	m = n;
	T = findT(a, m, i);

	if (T == 1 || T == i - 1){return 1;}

	for (j = 0; j < k; j++){
		T = findT(T, 2, i);
		if (T == 1){return 0;}
		if (T == i - 1){return 1;}
	}
	return 0;
}

int findT(int a, int m, int n){
	int r;
	int y = 1;

	while (m > 0){
		r = m % 2;
		exp_f(r, n, &y, &a);	// only does this if r = 1 (m odd)
		m = m / 2;
	}
	return y;
}

void exp_f(int bit, int n, int* y, int* a){
	if (bit == 1){*y = (*y * (*a)) % n;}
	*a = (*a) * (*a) % n;
	return;
}

int inverse(int a, int b){
	int inv;
	int q, r, t;
	int r1 = a, r2 = b;
	int t1 = 0, t2 = 1;

	while (r2 > 0){
		q = r1 / r2;
		r = r1 - q * r2;
		r1 = r2;
		r2 = r;

		t = t1 - q * t2;
		t1 = t2;
		t2 = t;
	}

	if (r1 == 1){inv = t1;}
	if (inv < 0){inv = inv + a;}

	return inv;
}

void encrypt(int value, FILE* out){
	int cipher;
	cipher = findT(value, e, n);
	fprintf(out, "%d ", cipher);
	return;
}

void decrypt(int value, FILE* out){
	int decipher;
	decipher = findT(value, d, n);
	fprintf(out, "%c", decipher);
	return;
}

int generateKeys(){

	int p, q;
	int phi_n;
	
	//Generate p and q so they have no primarity with 2
	do{do{p = rand();}  while(p % 2 == 0);}  while(!primarity(2, p));
	do{do{q = rand();}  while(q % 2 == 0);}  while(!primarity(2, q));

	n = p * q;
	phi_n = (p - 1) * (q - 1);

	do{e = rand() % (phi_n - 2) + 2;} // 1 < e < phi_n
	while (gcd(e, phi_n) != 1);

	d = inverse(phi_n, e);
	return d;
}

int main(void){

//	int e, d, n; //global variables

	FILE *inp, *out;			// Create file pointers
	out = fopen("cipher.txt", "w+");	// Empty file: cipher.txt, write
	fclose(out);
	out = fopen("decipher.txt", "w+");	// Empty file: decipher.txt, writing
	fclose(out);
	
	generateKeys();				// Generate Keys

	inp = fopen("plain.txt", "r+");
	if (inp == NULL){exit(1);}
	out = fopen("cipher.txt", "w+");
	if (out == NULL){exit(1);}

	// encryption starts
	while (1){
		char ch = getc(inp);		// Get all charachters from input file
		if (ch == -1){break;}
		int value = toascii(ch);
		encrypt(value, out);		// Pass char and cypher.txt to encryption
	}

	fclose(inp);
	fclose(out);

	// decryption starts
	inp = fopen("cipher.txt", "r");
	if (inp == NULL){exit(1);}
	out = fopen("decipher.txt", "w+");
	if (out == NULL){exit(1);}

	while (1){
		int cip;
		if (fscanf(inp, "%d", &cip) == -1){break;}
		decrypt(cip, out);
	}
	fclose(out);

	return 0;
}
