int isNum(char * to_check)
{
	int i = 0;
	while(to_check[i] != '\0')
	{
		if(!isdigit(to_check[i]))
		{
			return -1;
		}
	}
	return 0;
}
