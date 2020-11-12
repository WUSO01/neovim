call defx#custom#option('_', {
	\ 'columns': 'indent:icon:filename:type',
	\ 'winwidth': 30,
	\ 'split': 'vertical',
	\ 'direction': 'topleft',
	\ 'show_ignored_files': 0,
	\ 'root_marker': '😯',
	\ 'buffer_name': 'Explorer',
	\ 'toggle': 1,
	\ 'ignored_files':
	\     '.mypy_cache,.pytest_cache,.git,.hg,.svn,.stversions'
	\   . ',__pycache__,.sass-cache,*.egg-info,.DS_Store,*.pyc,*.swp'
	\ })

call defx#custom#column('icon', {
	\ 'directory_icon': '▸',
	\ 'opened_icon': '▾',
	\ 'root_icon': '☂︎',
	\ })

call defx#custom#column('filename', {
	\ 'min_width': 40,
	\ 'max_width': 40,
	\ })
