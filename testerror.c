/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: mbenhass <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/01/08 15:27:33 by mbenhass          #+#    #+#             */
/*   Updated: 2019/01/08 16:56:17 by mbenhass         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "get_next_line.h"

#include <stdio.h>
#include <fcntl.h>

int main(int ac, char **av)
{
	int fd;
	char *line;
	fd = 42;
	int ret;
	while ((ret = get_next_line(fd, &line)) > 0)
			printf("%s\n", line);
	printf("%d\n",ret);
}
