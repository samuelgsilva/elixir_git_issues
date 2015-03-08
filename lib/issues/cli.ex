defmodule Issues.CLI do

	@default_count 4

	@moduledoc """
	Manipula a linha de comando executada com seus respectivos
	parametros e direciona para as funçoes apropriadas que no final
	vao gerar uma tabela com as ultimas n_issues do projeto do github.
	"""

	def run(argsv) do
		parse_args(argsv)
	end

	@doc """
	Para execuçao existem 2 opçoes de entradas (diferentes argsv), sao elas:

	1- -h ou --help que retorna :help
	2- github user, nome do projeto e numero de linhas de issues de retorno.
	Este ultimo opcional.

	"""

	def parse_args(argsv) do
		args = OptionParser.parse(argsv, switches: [help: :boolean], aliases: [h: :help])
		dispatch(args)
	end

	defp dispatch({[help: true], _, _}) do
		:help
	end

	defp dispatch({_, [user, project, count], _}) do
		{user, project, String.to_integer count}
	end

	defp dispatch({_, [user, project], _}) do
		{user, project, @default_count}
	end
end