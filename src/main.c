#include <stdio.h>
#include <sqlite3.h>
#include <stdlib.h>

int	main(void)
{
	sqlite3 *db;
   int rc;

   rc = sqlite3_open("test.db", &db);

   if( rc ) {
      fprintf(stderr, "Can't open database: %s\n", sqlite3_errmsg(db));
      return(0);
   } else {
      fprintf(stderr, "Opened database successfully\n");
   }
   sqlite3_close(db);printf("Hello, World\n");
}
