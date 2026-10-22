#include "consts.h"
#include <stdio.h>
#include <sqlite3.h>
#include <stdlib.h>
#include <string.h>

void	init_db_content(sqlite3 *conn)
{
	sqlite3_stmt
}

sqlite3 *init_database(void)
{
	sqlite3	*connection;
	char	path[255];
	char	*home;
	int		conn_rc;
	
	home = getenv("HOME");
	if (!home)
	{
		perror("$HOME is not set.");
		exit(EXIT_FAILURE);
	}
	sprintf(path, "%s%s", getenv("HOME"), MINIRA_FILENAME);
	conn_rc = sqlite3_open(path, &connection);
	if (conn_rc)
	{
		perror(sqlite3_errmsg(connection));
		exit(EXIT_FAILURE);
	}
	else
		init_db_content(connection);
	return (connection);
}

int	main(void)
{
	sqlite3 *db;

	db = init_database();

	sqlite3_close(db);
	printf("Hello, World\n");
}
