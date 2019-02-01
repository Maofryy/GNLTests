/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: mbenhass <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/01/08 16:57:57 by mbenhass          #+#    #+#             */
/*   Updated: 2019/01/08 16:58:02 by mbenhass         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "get_next_line.h"

#include <stdio.h>
#include <fcntl.h>

int main(int ac, char **av)
{
	int fd;
	char *line;
	if (ac != 2)
	{
		fd = 0;
	}
	else
	{
		fd = open(av[1], O_RDONLY);
	}
	while (get_next_line(fd, &line) > 0)
		printf("%s\n", line);
	if (fd != 0)
		close(fd);
}
