defmodule CliTest do
	use ExUnit.Case

	import Issues.CLI, only: [parse_args: 1]

	test ":help e retonado quando temos como parametro --help ou -h" do
		assert parse_args(["-h", "anything"]) == :help
		assert parse_args(["--help", "anything"]) == :help
	end

	test "se retorna os tres valores se todos parametros forem passados" do
		assert parse_args(["samuelgsilva", "git_issues", "10"]) == {"samuelgsilva", "git_issues", 10}
	end

	test "se retorna 2 valores mais default_count se apenas dois parametros forem passados" do
		assert parse_args(["samuelgsilva", "git_issues"]) == {"samuelgsilva", "git_issues", 4}
	end
end