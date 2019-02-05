/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: mbenhass <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/01/08 15:27:33 by mbenhass          #+#    #+#             */
/*   Updated: 2019/02/05 14:05:27 by mbenhass         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "get_next_line.h"

#include <stdio.h>
#include <fcntl.h>

int main(void)
{
	int fd;
	char *line;
	fd = 42;
	int ret;

	while ((ret = get_next_line(fd, &line)) > 0)
		;//printf("%s\n",line);
	printf("%d\n",ret);
}
