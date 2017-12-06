# bubbleSortASM
x86 assembly bubble sort

### Call function in cpp
1. add this line after all the includes
   - extern "C" void bubbleSortAsm(size_t* array, size_t length);

2. Now you can call the function when you want \n
   - ex: bubbleSortAsm(_array, _length);
