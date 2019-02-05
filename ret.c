/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ret.c                                              :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: mbenhass <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/01/08 16:57:57 by mbenhass          #+#    #+#             */
/*   Updated: 2019/02/05 14:59:20 by mbenhass         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "get_next_line.h"

#include <stdio.h>
#include <fcntl.h>

int main(int ac, char **av)
{
	int fd;
	char *line;
	int ret;
	if (ac != 3)
		fd = 0;
	else
		fd = open(av[1], O_RDONLY);
	int i = 0;
	while (i++ < ft_atoi(av[2]))
		ret = get_next_line(fd, &line);
	if (fd != 0)
		close(fd);
	printf("%d\n",ret);
	return (0);
}
