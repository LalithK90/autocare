package lk;

public class QuickSort {

  static void printArray(int arr[]) {
    int n = arr.length;
    for ( int i = 0; i < n; ++i )
      System.out.print(arr[i] + " ");
    System.out.println();
  }

  int partition(int arr[], int low, int high) {
    int pivot = arr[low];
    int start = low;
    int end = high;

    while ( start < end ) {
      while ( arr[start] <= pivot ) {
        start++;
      }
      while ( arr[end] > pivot ) {
        end--;
      }
      if ( start < end ) {
        int temp = arr[start];
        arr[start] = arr[end];
        arr[end] = temp;
      }
    }

    int temp = arr[low];
    arr[low] = arr[end];
    arr[end] = temp;
    printArray(arr);

    return end;
  }

  void sort(int arr[], int low, int high) {
    if ( low < high ) {
      int loc = partition(arr, low, high);
      sort(arr, low, loc - 1);
      sort(arr, loc + 1, high);
    }
  }


  public static void main(String args[]) {
    int arr[] = {7, 11, 14, 6, 9, 4, 3, 12};
    int n = arr.length;

    QuickSort ob = new QuickSort();
		try {
			ob.sort(arr, 0, n-1);
		} catch ( Exception e ) {
			e.printStackTrace();
		}

		System.out.println("sorted array");

  }

}

