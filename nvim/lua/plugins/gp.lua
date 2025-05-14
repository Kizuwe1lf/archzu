-- plugins/gp.lua
return {
    "robitx/gp.nvim",
    config = function()
        require("gp").setup({
	  default_command_agent = "ollama",
	  default_chat_agent = "ollama",
	  providers = {
 	    ollama = {
 	      endpoint = "http://localhost:11434/v1/chat/completions",
 	    },
	  },

          agents = {
            {
	       name = "ollama",
	       provider = "ollama",
	       model = "codellama:7b",
	       system_prompt = "Concise, Types at max speed"
            },
          },
	})
    end,
}
