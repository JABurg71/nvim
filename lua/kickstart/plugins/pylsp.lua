return {
  settings = {
    pylsp = {
      plugins = {
	pycodestyle = {
	  ignore = {'W391', 'E501', 'E302'},
	  maxLineLength = 300,
	}
      }
    }
  }
}

