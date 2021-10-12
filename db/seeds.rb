puts "--> Criando Usuario \n"
User.create(email: "nathanbispo.np@gmail.com", password: "123456")

puts "--> Criando Filme \n"
Movie.create(api_id: 109418,
  title: "Gente Grande 2",
  overview: "Lenny Feder e sua família se mudam para sua cidade natal para ficar perto dos amigos, mas acabam tendo que enfrentar alguns fantasmas do passado, como a covardia diante de valentões e o famigerado bullying na escola.",
  poster_path: "/vaXiEVLD0fGSMU801Zftw1csPPm.jpg")
