#include <stdlib.h>
#include <string.h>
void quicksort(float * array, int first, int last)
{
    if (first>last)
	{
		return;
	}
    float temp;
	int i = first;
	int j = last;
	int mid = first + (last-first)/2;
	float pivot = array[mid];
	while (i < j)
	{
		while (array[i] > pivot)
		{
			i++;
		}
		while (array[j] < pivot)
		{
			j--;
		}
        if (i <= j)
        {
            temp = array[i];
            array[i] = array[j];
            array[j] = temp;
            i++; //using this prevents a "do while"
            j--;
        }
	}
    if (first < j)
        quicksort(array, first, j);
    if (i < last)
        quicksort(array, i, last);
}

// Dont need to do error checks as existence is guaranteed ;)
int binary_search(float *array, int first, int last, float el)
{
    int mid = first + (last-first)/2;
	if (array[mid] == el)
	{
		return mid + 1;
	}
	if (el > array[mid])
	{
		return binary_search(array,first,mid-1,el);
	}
	else
	{
		return binary_search(array,mid+1,last,el);
	}
}
int cmp(const void *a, const void *b) {
    return -( *(int*)a - *(int*)b );
}
void compute_ranks(float *F, int N, int *R, float *avg, float *passing_avg, int *num_passed) {
    int i;
    *num_passed = 0;
    *avg = 0.0;
    *passing_avg = 0.0;
    if (N <= 0) return;

    // create temp array J for sorting
    size_t sz = sizeof(float)*N;
    float * J = malloc(sz);
    memcpy(J, F, sz);

    quicksort(J,0,N-1);
    // compute ranks
    for (i = 0; i < N; ++i) {
        R[i] = binary_search(J,0,N-1,F[i]);
        *avg += F[i];
        if (F[i] >= 50.0) {
            *passing_avg += F[i];
            *num_passed += 1;
        }
    }
    // check for div by 0
    *avg /= N;
    if (*num_passed) *passing_avg /= *num_passed;
    free(J);
} // compute_ranks
