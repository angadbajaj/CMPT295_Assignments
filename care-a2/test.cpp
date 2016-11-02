#include <iostream>
#include <vector>
#include <utility>

void quicksort(int * array, int first, int last)
{
    if(first > last)
    {
        return;
    }
    int i = first;
    int j = last;
    int mid = first + (last-first)/2;
    int pivot = array[mid];

    while(i < j)
    {
        while(array[i] < pivot)
        {
            i++;
        }
        while(array[j] > pivot)
        {
            j--;
        }
        if(i<=j)
        {
            std::swap(array[i],array[j]);
            i++;
            j--;
        }
    }

    if(first < j)
    {
        quicksort(array, first, j);
    }
    if(i < last)
    {
        quicksort(array,i,last);
    }

}
int main()
{
    std::vector<int> array = {1,2,3,4,5,8,9};
    int len = array.size()*array.size();
    int * count = new int[len];
    for(int i = 0; i < len; i++)
    {
        count[i] = 0;
    }
    int k = 0;
    for(int i = 0; i < array.size();i++)
    {
        for(int j = 0; j < array.size(); j++)
        {
            count[k] = array[i]*array[j];
            k++;
        }
    }
    int curr = 0;

    quicksort(count,0,len-1);
    std::vector<int> out;
    out.push_back(count[0]);
    int outCount = 0;

    for(int i = 1; i < len; i++)
    {
        if(count[i] != out[outCount])
        {
            out.push_back(count[i]);
            outCount++;
        }
    }
    for(int i = 0; i < out.size(); i++)
    {
        std::cout << out[i] << std::endl;
    }
    std::cout << std::endl;

    std::cout << out.size() << std::endl;
    delete[] count;
    return 0;
}
