# WARNING:
# In production the passwords need to use ENV

if User.exists?(username: 'Guest')
	User.create(username: 'Guest', password: 'opensesame')
end
if User.exists?(username: 'System')
	User.create(username: 'System', password: 'opensesame')
end