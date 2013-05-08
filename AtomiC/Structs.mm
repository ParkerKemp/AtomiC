#include "Structs.h"

NSString *resourcePath(const char *filename){
	return [[NSBundle mainBundle] pathForResource:[NSString stringWithUTF8String:filename] ofType:nil];
	}