defmodule Issues.GithubIssues do

	def fetch(user, project) do
		issues_url(user, project) |> HTTPotion.get([{"user-agent", "samuelgsilva"}]) |> handle_response
	end

	def issues_url(user, project) do
		"https://api.github.com/repos/#{user}/#{project}/issues"
	end

	def handle_response(%{body: body, headers: headers, status_code: 200}) do
		[body, headers, :ok]
	end
	def handle_response(%{body: body, headers: headers, status_code: ___}) do 
		[body, headers, :error]
	end
end