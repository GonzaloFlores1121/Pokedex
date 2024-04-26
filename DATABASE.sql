CREATE DATABASE pokedex;

USE pokedex;

CREATE TABLE usuario (
	id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    nombre VARCHAR(24) NOT NULL,
    contraseña VARCHAR(16) NOT NULL
) AUTO_INCREMENT=1;

CREATE TABLE pokemon (
	id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    nombre VARCHAR(32) NOT NULL,
    numero INT NOT NULL,
    primer_tipo VARCHAR(16) NOT NULL,
    segundo_tipo VARCHAR(16) DEFAULT NULL,
    imagen VARCHAR(128) NOT NULL,
    descripcion LONGTEXT NOT NULL
) AUTO_INCREMENT=1;

INSERT INTO usuario(nombre, contraseña) VALUES ('admin', '1234');
INSERT INTO pokemon(nombre, numero, primer_tipo, segundo_tipo, imagen, descripcion)
VALUES 
('Bulbasaur', 1, 'planta', 'veneno', 'Bulbasaur', 'Bulbasaur es un Pokémon de tipo planta/veneno introducido en la primera generación. 
Es uno de los tres Pokémon iniciales que pueden elegir los entrenadores que empiezan su aventura en la región de Kanto, junto a Charmander y Squirtle. 
Se destaca por ser el primer Pokémon de la Pokédex Nacional.'),
('Ivysaur', 2, 'planta', 'veneno', 'Ivysaur', 'Ivysaur es un Pokémon de tipo planta/veneno introducido en la primera generación. 
Es la evolución de Bulbasaur, uno de los Pokémon iniciales de Kanto.'),
('Venusaur', 3, 'planta', 'veneno', 'Venusaur', 'Venusaur es un Pokémon de tipo planta/veneno introducido en la primera generación. 
Es la evolución de Ivysaur.'),
('Charmander', 4, 'fuego', NULL, 'Charmander', 'Charmander es un Pokémon de tipo fuego introducido en la primera generación. 
Es uno de los tres Pokémon iniciales que pueden elegir los entrenadores que empiezan su aventura en la región de Kanto, junto a Bulbasaur y Squirtle.'),
('Charmeleon', 5, 'fuego', NULL, 'Charmeleon', 'Charmeleon es un Pokémon de tipo fuego introducido en la primera generación. 
Es la evolución de Charmander, uno de los Pokémon iniciales de los entrenadores que comienzan su aventura en la región de Kanto.'),
('Charizard', 6, 'fuego', 'volador', 'Charizard', 'Charizard es un Pokémon de tipo fuego/volador introducido en la primera generación. 
Es la evolución de Charmeleon.'),
('Squirtle', 7, 'agua', NULL, 'Squirtle', 'Squirtle es un Pokémon de tipo agua introducido en la primera generación. 
Es uno de los tres Pokémon iniciales que pueden elegir los entrenadores que empiezan su aventura en la región de Kanto, junto a Bulbasaur y Charmander.'),
('Wartortle', 8, 'agua', NULL, 'Wartortle', 'Wartortle es un Pokémon de tipo agua introducido en la primera generación. 
Es la evolución de Squirtle, uno de los Pokémon iniciales de Kanto.'),
('Blastoise', 9, 'agua', NULL, 'Blastoise', 'Blastoise es un Pokémon de tipo agua introducido en la primera generación. 
Es la evolución de Wartortle.'),
('Caterpie', 10, 'bicho', NULL, 'Caterpie', 'Caterpie es un Pokémon de tipo bicho introducido en la primera generación.'),
('Metapod', 11, 'bicho', NULL, 'Metapod', 'Metapod es un Pokémon de tipo bicho introducido en la primera generación. 
Es la evolución de Caterpie.'),
('Butterfree', 12, 'bicho', 'volador', 'Butterfree', 'Butterfree es un Pokémon de tipo bicho/volador introducido en la primera generación. 
Es la evolución de Metapod.'),
('Weedle', 13, 'bicho', 'veneno', 'Weedle', 'Weedle es un Pokémon de tipo bicho/veneno introducido en la primera generación.'),
('Kakuna', 14, 'bicho', 'veneno', 'Kakuna', 'Kakuna es un Pokémon tipo bicho/veneno introducido en la primera generación. 
Es la evolución de Weedle.'),
('Beedrill', 15, 'bicho', 'veneno', 'Beedrill', 'Beedrill es un Pokémon de tipo bicho/veneno introducido en la primera generación. 
Es la evolución de Kakuna.'),
('Pidgey', 16, 'normal', 'volador', 'Pidgey', 'Pidgey es un Pokémon de tipo normal/volador introducido en la primera generación.'),
('Pidgeotto', 17, 'normal', 'volador', 'Pidgeotto', 'Pidgeotto es un Pokémon de tipo normal/volador introducido en la primera generación. 
Es la evolución de Pidgey.'),
('Pidgeot', 18, 'normal', 'volador', 'Pidgeot', 'Pidgeot es un Pokémon de tipo normal/volador introducido en la primera generación. 
Es la evolución de Pidgeotto.'),
('Rattata', 19, 'normal', NULL, 'Rattata', 'Rattata es un Pokémon de tipo normal introducido en la primera generación. 
Es la forma habitual del Rattata de Alola.'),
('Raticate', 20, 'normal', NULL, 'Raticate', 'Raticate es un Pokémon tipo normal introducido en la primera generación. 
Es la evolución de Rattata.'),
('Spearow', 21, 'normal', 'volador', 'Spearow', 'Spearow es un Pokémon de tipo normal/volador introducido en la primera generación.'),
('Fearow', 22, 'normal', 'volador', 'Fearow', 'Fearow es un Pokémon de tipo normal/volador introducido en la primera generación. 
Es la evolución de Spearow.'),
('Ekans', 23, 'veneno', NULL, 'Ekans', 'Ekans es un Pokémon de tipo veneno introducido en la primera generación.'),
('Arbok', 24, 'veneno', NULL, 'Arbok', 'Arbok es un Pokémon de tipo veneno introducido en la primera generación. 
Es la evolución de Ekans.'),
('Pikachu', 25, 'electrico', NULL, 'Pikachu', "Pikachu es un Pokémon de tipo eléctrico introducido en la primera generación. 
Es el Pokémon más conocido de la historia, mayormente por ser el acompañante del protagonista del anime, Ash Ketchum y la mascota representante de la franquicia Pokémon. 
Es el Pokémon inicial que usan los entrenadores que empiezan su aventura en la región de Kanto en Pokémon Amarillo y Pokémon: Let's Go, Pikachu!. 
A partir de la segunda generación es la evolución de Pichu."),
('Raichu', 26, 'electrico', NULL, 'Raichu', 'Raichu es un Pokémon de tipo eléctrico introducido en la primera generación. 
Es una de las dos posibles evoluciones de Pikachu y la forma habitual del Raichu de Alola.'),
('Sandshrew', 27, 'tierra', NULL, 'Sandshrew', 'Sandshrew es un Pokémon de tipo tierra introducido en la primera generación.'),
('Sandslash', 28, 'tierra', NULL, 'Sandslash', 'Sandslash es un Pokémon de tipo tierra introducido en la primera generación. 
Es la evolución de Sandshrew y la forma habitual del Sandslash de Alola.'),
('Nidoran♀', 29, 'veneno', NULL, 'Nidoran_hembra', 'Nidoran♀ es un Pokémon de tipo veneno introducido en la primera generación. 
Su contraparte masculina es Nidoran♂.'),
('Nidorina', 30, 'veneno', NULL, 'Nidorina', 'Nidorina es un Pokémon de tipo veneno introducido en la primera generación. 
Es la forma evolucionada de Nidoran♀.'),
('Nidoqueen', 31, 'veneno', 'tierra', 'Nidoqueen', 'Nidoqueen es un Pokémon de tipo veneno/tierra introducido en la primera generación. 
Es la evolución de Nidorina.'),
('Nidoran♂', 32, 'veneno', NULL, 'Nidoran_macho', 'Nidoran♂ es un Pokémon de tipo veneno introducido en la primera generación. 
Su contraparte femenina es Nidoran♀.'),
('Nidorino', 33, 'veneno', NULL, 'Nidorino', 'Nidorino es un Pokémon de tipo veneno introducido en la primera generación. 
Es la evolución de Nidoran♂.'),
('Nidoking', 34, 'veneno', 'tierra', 'Nidoking', 'Nidoking es un Pokémon de tipo veneno/tierra introducido en la primera generación. 
Es la evolución de Nidorino.'),
('Clefairy', 35, 'hada', NULL, 'Clefairy', 'Clefairy es un Pokémon de tipo hada introducido en la primera generación. 
A partir de la segunda generación es la evolución de Cleffa.'),
('Clefable', 36, 'hada', NULL, 'Clefable', 'Clefable es un Pokémon de tipo hada introducido en la primera generación. 
Es la evolución de Clefairy.'),
('Vulpix', 37, 'fuego', NULL, 'Vulpix', 'Vulpix es un Pokémon de tipo fuego introducido en la primera generación. 
Es la forma habitual del Vulpix de Alola.'),
('Ninetales', 38, 'fuego', NULL, 'Ninetales', 'Ninetales es un Pokémon de tipo fuego introducido en la primera generación. 
Es la evolución de Vulpix y la forma habitual del Ninetales de Alola.'),
('Jigglypuff', 39, 'normal', 'hada', 'Jigglypuff', 'Jigglypuff es un Pokémon de tipo normal/hada introducido en la primera generación. 
A partir de la segunda generación es la evolución de Igglybuff.'),
('Wigglytuff', 40, 'normal', 'hada', 'Wigglytuff', 'Wigglytuff es un Pokémon de tipo normal/hada introducido en la primera generación. 
Es la evolución de Jigglypuff.'),
('Zubat', 41, 'veneno', 'volador', 'Zubat', 'Zubat es un Pokémon de tipo veneno/volador introducido en la primera generación.'),
('Golbat', 42, 'veneno', 'volador', 'Golbat', 'Golbat es un Pokémon de tipo veneno/volador introducido en la primera generación. 
Es la evolución de Zubat.'),
('Oddish', 43, 'planta', 'veneno', 'Oddish', 'Oddish es un Pokémon de tipo planta/veneno introducido en la primera generación.'),
('Gloom', 44, 'planta', 'veneno', 'Gloom', 'Gloom es un Pokémon de tipo planta/veneno introducido en la primera generación. 
Es la evolución de Oddish.'),
('Vileplume', 45, 'planta', 'veneno', 'Vileplume', 'Vileplume es un Pokémon de tipo planta/veneno introducido en la primera generación. 
Es una de las dos posibles evoluciones de Gloom.'),
('Paras', 46, 'bicho', 'planta', 'Paras', 'Paras es un Pokémon de tipo bicho/planta introducido en la primera generación.'),
('Parasect', 47, 'bicho', 'planta', 'Parasect', 'Parasect es un Pokémon de tipo bicho/planta introducido en la primera generación. 
Es la evolución de Paras.'),
('Venonat', 48, 'bicho', 'veneno', 'Venonat', 'Venonat es un Pokémon de tipo bicho/veneno introducido en la primera generación.'),
('Venomoth', 49, 'bicho', 'veneno', 'Venomoth', 'Venomoth es un Pokémon de tipo bicho/veneno introducido en la primera generación. 
Es la evolución de Venonat.'),
('Diglett', 50, 'tierra', NULL, 'Diglett', 'Diglett es un Pokémon de tipo tierra introducido en la primera generación. 
Es la forma habitual del Diglett de Alola.'),
('Dugtrio', 51, 'tierra', NULL, 'Dugtrio', 'Dugtrio es un Pokémon de tipo tierra introducido en la primera generación. 
Es la evolución de Diglett y la forma habitual del Dugtrio de Alola.'),
('Meowth', 52, 'normal', NULL, 'Meowth', 'Meowth es un Pokémon de tipo normal introducido en la primera generación. 
A partir de la séptima generación posee una forma regional de tipo siniestro, y a partir de la octava generación posee una forma regional de tipo acero.'),
('Persian', 53, 'normal', NULL, 'Persian', 'Persian es un Pokémon de tipo normal introducido en la primera generación. 
Es la forma habitual del Persian de Alola. 
También es la evolución de Meowth.'),
('Psyduck', 54, 'agua', NULL, 'Psyduck', 'Psyduck es un Pokémon de tipo agua introducido en la primera generación.'),
('Golduck', 55, 'agua', NULL, 'Golduck', 'Golduck es un Pokémon de tipo agua introducido en la primera generación. 
Es la evolución de Psyduck.'),
('Mankey', 56, 'lucha', NULL, 'Mankey', 'Mankey es un Pokémon de tipo lucha introducido en la primera generación.'),
('Primeape', 57, 'lucha', NULL, 'Primeape', 'Primeape es un Pokémon de tipo lucha introducido en la primera generación. 
Es la evolución de Mankey.'),
('Growlithe', 58, 'fuego', NULL, 'Growlithe', 'Growlithe es un Pokémon de tipo fuego introducido en la primera generación.'),
('Arcanine', 59, 'fuego', NULL, 'Arcanine', 'Arcanine es un Pokémon de tipo fuego introducido en la primera generación. 
Es la evolución de Growlithe.'),
('Poliwag', 60, 'agua', NULL, 'Poliwag', 'Poliwag es un Pokémon de tipo agua introducido en la primera generación.'),
('Poliwhirl', 61, 'agua', NULL, 'Poliwhirl', 'Poliwhirl es un Pokémon de tipo agua introducido en la primera generación. 
Es la evolución de Poliwag.'),
('Poliwrath', 62, 'agua', 'lucha', 'Poliwrath', 'Poliwrath es un Pokémon de tipo agua/lucha introducido en la primera generación. 
Es una de las posibles evoluciones de Poliwhirl.'),
('Abra', 63, 'psiquico', NULL, 'Abra', 'Abra es un Pokémon de tipo psíquico introducido en la primera generación.'),
('Kadabra', 64, 'psiquico', NULL, 'Kadabra', 'Kadabra es un Pokémon de tipo psíquico introducido en la primera generación. 
Es la evolución de Abra.'),
('Alakazam', 65, 'psiquico', NULL, 'Alakazam', 'Alakazam es un Pokémon de tipo psíquico introducido en la primera generación. 
Es la evolución de Kadabra.'),
('Machop', 66, 'lucha', NULL, 'Machop', 'Machop es un Pokémon de tipo lucha introducido en la primera generación.'),
('Machoke', 67, 'lucha', NULL, 'Machoke', 'Machoke es un Pokémon de tipo lucha introducido en la primera generación. 
Es la evolución de Machop.'),
('Machamp', 68, 'lucha', NULL, 'Machamp', 'Machamp es un Pokémon de tipo lucha introducido en la primera generación. 
Es la evolución de Machoke.'),
('Bellsprout', 69, 'planta', 'veneno', 'Bellsprout', 'Bellsprout es un Pokémon de tipo planta/veneno introducido en la primera generación.'),
('Weepinbell', 70, 'planta', 'veneno', 'Weepinbell', 'Weepinbell es un Pokémon de tipo planta/veneno introducido en la primera generación. 
Es la evolución de Bellsprout.'),
('Victreebel', 71, 'planta', 'veneno', 'Victreebel', 'Victreebel es un Pokémon de tipo planta/veneno introducido en la primera generación. 
Es la evolución de Weepinbell.'),
('Tentacool', 72, 'agua', 'veneno', 'Tentacool', 'Tentacool es un Pokémon de tipo agua/veneno introducido en la primera generación.'),
('Tentacruel', 73, 'agua', 'veneno', 'Tentacruel', 'Tentacruel es un Pokémon de tipo agua/veneno introducido en la primera generación. 
Es la evolución de Tentacool.'),
('Geodude', 74, 'roca', 'tierra', 'Geodude', 'Geodude es un Pokémon de tipo roca/tierra introducido en la primera generación. 
Es la forma habitual del Geodude de Alola.'),
('Graveler', 75, 'roca', 'tierra', 'Graveler', 'Graveler es un Pokémon de tipo roca/tierra introducido en la primera generación. 
Es la evolución de Geodude y la forma habitual del Graveler de Alola.'),
('Golem', 76, 'roca', 'tierra', 'Golem', 'Golem es un Pokémon de tipo roca/tierra introducido en la primera generación. 
Es la evolución de Graveler.'),
('Ponyta', 77, 'fuego', NULL, 'Ponyta', 'Ponyta es un Pokémon de tipo fuego introducido en la primera generación.'),
('Rapidash', 78, 'fuego', NULL, 'Rapidash', 'Rapidash es un Pokémon de tipo fuego introducido en la primera generación. 
Es la evolución de Ponyta.'),
('Slowpoke', 79, 'agua', 'psiquico', 'Slowpoke', 'Slowpoke es un Pokémon de tipo agua/psíquico introducido en la primera generación.'),
('Slowbro', 80, 'agua', 'psiquico', 'Slowbro', 'Slowbro es un Pokémon de tipo agua/psíquico introducido en la primera generación. 
Es una de las dos evoluciones posibles de Slowpoke.'),
('Magnemite', 81, 'electrico', 'acero', 'Magnemite', 'Magnemite es un Pokémon de tipo eléctrico/acero introducido en la primera generación. 
Es un Pokémon artificial.'),
('Magneton', 82, 'electrico', 'acero', 'Magneton', 'Magneton es un Pokémon artificial de tipo eléctrico/acero introducido en la primera generación. 
Es la evolución de Magnemite.'),
("Farfetch'd", 83, 'normal', 'volador', "Farfetch_d", "Farfetch'd es un Pokémon de tipo normal/volador introducido en la primera generación."),
('Doduo', 84, 'normal', 'volador', 'Doduo', 'Doduo es un Pokémon de tipo normal/volador introducido en la primera generación.'),
('Dodrio', 85, 'normal', 'volador', 'Dodrio', 'Dodrio es un Pokémon de tipo normal/volador introducido en la primera generación. 
Es la evolución de Doduo.'),
('Seel', 86, 'agua', NULL, 'Seel', 'Seel es un Pokémon de tipo agua introducido en la primera generación.'),
('Dewgong', 87, 'agua', 'hielo', 'Dewgong', 'Dewgong es un Pokémon de tipo agua/hielo introducido en la primera generación. 
Es la evolución de Seel.'),
('Grimer', 88, 'veneno', NULL, 'Grimer', 'Grimer es un Pokémon artificial de tipo veneno introducido en la primera generación.'),
('Muk', 89, 'veneno', NULL, 'Muk', 'Muk es un Pokémon artificial de tipo veneno introducido en la primera generación. 
Es la evolución de Grimer.'),
('Shellder', 90, 'agua', NULL, 'Shellder', 'Shellder es un Pokémon de tipo agua introducido en la primera generación.'),
('Cloyster', 91, 'agua', 'hielo', 'Cloyster', 'Cloyster es un Pokémon de tipo agua/hielo introducido en la primera generación. 
Es la evolución de Shellder.'),
('Gastly', 92, 'fantasma', 'veneno', 'Gastly', 'Gastly es un Pokémon tipo fantasma/veneno introducido en la primera generación.'),
('Haunter', 93, 'fantasma', 'veneno', 'Haunter', 'Haunter es un Pokémon de tipo fantasma/veneno introducido en la primera generación. 
Es la evolución de Gastly.'),
('Gengar', 94, 'fantasma', 'veneno', 'Gengar', 'Gengar es un Pokémon de tipo fantasma/veneno introducido en la primera generación. 
Es la evolución de Haunter.'),
('Onix', 95, 'roca', 'tierra', 'Onix', 'Onix es un Pokémon de tipo roca/tierra introducido en la primera generación.'),
('Drowzee', 96, 'psiquico', NULL, 'Drowzee', 'Drowzee es un Pokémon de tipo psíquico introducido en la primera generación.'),
('Hypno', 97, 'psiquico', NULL, 'Hypno', 'Hypno es un Pokémon de tipo psíquico introducido en la primera generación. 
Es la evolución de Drowzee.'),
('Krabby', 98, 'agua', NULL, 'Krabby', 'Krabby es un Pokémon de tipo agua introducido en la primera generación.'),
('Kingler', 99, 'agua', NULL, 'Kingler', 'Kingler es un Pokémon de tipo agua introducido en la primera generación. 
Es la evolución de Krabby.'),
('Voltorb', 100, 'electrico', NULL, 'Voltorb', 'Voltorb es un Pokémon artificial de tipo eléctrico introducido en la primera generación.'),
('Electrode', 101, 'electrico', NULL, 'Electrode', 'Electrode es un Pokémon artificial de tipo eléctrico introducido en la primera generación. 
Es la evolución de Voltorb.'),
('Exeggcute', 102, 'planta', 'psiquico', 'Exeggcute', 'Exeggcute es un Pokémon de tipo planta/psíquico introducido en la primera generación.'),
('Exeggutor', 103, 'planta', 'psiquico', 'Exeggutor', 'Exeggutor es un Pokémon de tipo planta/psíquico introducido en la primera generación. 
Es la evolución de Exeggcute y la forma habitual del Exeggutor de Alola.'),
('Cubone', 104, 'tierra', NULL, 'Cubone', 'Cubone es un Pokémon de tipo tierra introducido en la primera generación.'),
('Marowak', 105, 'tierra', NULL, 'Marowak', 'Marowak es un Pokémon de tipo tierra introducido en la primera generación. 
Es una de las dos posibles evoluciones de Cubone y la forma habitual del Marowak de Alola.'),
('Hitmonlee', 106, 'lucha', NULL, 'Hitmonlee', 'Hitmonlee es un Pokémon de tipo lucha introducido en la primera generación. 
Es una de las tres posibles evoluciones de Tyrogue.'),
('Hitmonchan', 107, 'lucha', NULL, 'Hitmonchan', 'Hitmonchan es un Pokémon de tipo lucha introducido en la primera generación. 
Es una de las tres posibles evoluciones de Tyrogue.'),
('Lickitung', 108, 'normal', NULL, 'Lickitung', 'Lickitung es un Pokémon de tipo normal introducido en la primera generación.'),
('Koffing', 109, 'veneno', NULL, 'Koffing', 'Koffing es un Pokémon de tipo veneno introducido en la primera generación.'),
('Weezing', 110, 'veneno', NULL, 'Weezing', 'Weezing es un Pokémon de tipo veneno introducido en la primera generación. 
Es la evolución de Koffing.'),
('Rhyhorn', 111, 'tierra', 'roca', 'Rhyhorn', 'Rhyhorn es un Pokémon de tipo tierra/roca introducido en la primera generación.'),
('Rhydon', 112, 'tierra', 'roca', 'Rhydon', 'Rhydon es un Pokémon de tipo tierra/roca introducido en la primera generación. 
Es la evolución de Rhyhorn.'),
('Chansey', 113, 'normal', NULL, 'Chansey', 'Chansey es un Pokémon de tipo normal introducido en la primera generación. 
A partir de la cuarta generación evoluciona de Happiny.'),
('Tangela', 114, 'planta', NULL, 'Tangela', 'Tangela es un Pokémon de tipo planta introducido en la primera generación.'),
('Kangaskhan', 115, 'normal', NULL, 'Kangaskhan', 'Kangaskhan es un Pokémon de tipo normal introducido en la primera generación.'),
('Horsea', 116, 'agua', NULL, 'Horsea', 'Horsea es un Pokémon de tipo agua introducido en la primera generación.'),
('Seadra', 117, 'agua', NULL, 'Seadra', 'Seadra es un Pokémon de tipo agua introducido en la primera generación. 
Es la evolución de Horsea.'),
('Goldeen', 118, 'agua', NULL, 'Goldeen', 'Goldeen es un Pokémon de tipo agua introducido en la primera generación.'),
('Seaking', 119, 'agua', NULL, 'Seaking', 'Seaking es un Pokémon de tipo agua introducido en la primera generación. 
Es la evolución de Goldeen.'),
('Staryu', 120, 'agua', NULL, 'Staryu', 'Staryu es un Pokémon de tipo agua introducido en la primera generación.'),
('Starmie', 121, 'agua', 'psiquico', 'Starmie', 'Starmie es un Pokémon de tipo agua/psíquico introducido en la primera generación. 
Es la evolución de Staryu.'),
('Mr. Mime', 122, 'psiquico', 'hada', 'Mr._mime', 'Mr. Mime es un Pokémon de tipo psíquico/hada introducido en la primera generación. 
A partir de la cuarta generación tiene una preevolución, Mime Jr..'),
('Scyther', 123, 'bicho', 'volador', 'Scyther', 'Scyther es un Pokémon de tipo bicho/volador introducido en la primera generación.'),
('Jynx', 124, 'hielo', 'psiquico', 'Jynx', 'Jynx es un Pokémon de tipo hielo/psíquico introducido en la primera generación. 
A partir de la segunda generación tiene una preevolución llamada Smoochum.'),
('Electabuzz', 125, 'electrico', NULL, 'Electabuzz', 'Electabuzz es un Pokémon de tipo eléctrico introducido en la primera generación. 
Es la evolución de Elekid.'),
('Magmar', 126, 'fuego', NULL, 'Magmar', 'Magmar es un Pokémon de tipo fuego introducido en la primera generación. 
A partir de la segunda generación es la evolución de Magby.'),
('Pinsir', 127, 'bicho', NULL, 'Pinsir', 'Pinsir es un Pokémon de tipo bicho introducido en la primera generación.'),
('Tauros', 128, 'normal', NULL, 'Tauros', 'Tauros es un Pokémon de tipo normal introducido en la primera generación.'),
('Magikarp', 129, 'agua', NULL, 'Magikarp', 'Magikarp es un Pokémon de tipo agua introducido en la primera generación. 
Es uno de los Pokémon con las características base más bajas de los videojuegos, pero con uno de los cambios más radicales, al momento de evolucionar a Gyarados.'),
('Gyarados', 130, 'agua', 'volador', 'Gyarados', 'Gyarados es un Pokémon de tipo agua/volador introducido en la primera generación. 
Es la evolución de Magikarp.'),
('Lapras', 131, 'agua', 'hielo', 'Lapras', 'Lapras es un Pokémon de tipo agua/hielo introducido en la primera generación.'),
('Ditto', 132, 'normal', NULL, 'Ditto', 'Ditto es un Pokémon de tipo normal introducido en la primera generación. 
Se destaca por poderse transformar en cualquier Pokémon.'),
('Eevee', 133, 'normal', NULL, 'Eevee', "Eevee es un Pokémon de tipo normal introducido en la primera generación. 
Se caracteriza por ser el Pokémon con más evoluciones posibles, con ocho. 
Es el Pokémon inicial en Pokémon: Let's Go, Eevee!."),
('Vaporeon', 134, 'agua', NULL, 'Vaporeon', 'Vaporeon es un Pokémon de tipo agua introducido en la primera generación. 
Es una de las ocho Eeveeluciones, es decir, las posibles evoluciones de Eevee.'),
('Jolteon', 135, 'electrico', NULL, 'Jolteon', 'Jolteon es un Pokémon de tipo eléctrico introducido en la primera generación. 
Es una de las ocho Eeveeluciones, es decir, las posibles evoluciones de Eevee.'),
('Flareon', 136, 'fuego', NULL, 'Flareon', 'Flareon es un Pokémon de tipo fuego introducido en la primera generación. 
Es una de las ocho Eeveeluciones, es decir, las posibles evoluciones de Eevee.'),
('Porygon', 137, 'normal', NULL, 'Porygon', 'Porygon es un Pokémon artificial de tipo normal introducido en la primera generación.'),
('Omanyte', 138, 'roca', 'agua', 'Omanyte', 'Omanyte es un Pokémon fósil de tipo roca/agua introducido en la primera generación.'),
('Omastar', 139, 'roca', 'agua', 'Omastar', 'Omastar es un Pokémon de tipo roca/agua, introducido en la primera generación. 
Es la evolución de Omanyte. 
Es un Pokémon fósil.'),
('Kabuto', 140, 'roca', 'agua', 'Kabuto', 'Kabuto es un Pokémon fósil de tipo roca/agua introducido en la primera generación.'),
('Kabutops', 141, 'roca', 'agua', 'Kabutops', 'Kabutops es un Pokémon fósil de tipo roca/agua introducido en la primera generación. 
Es la evolución de Kabuto.'),
('Aerodactyl', 142, 'roca', 'volador', 'Aerodactyl', 'Aerodactyl es un Pokémon de tipo roca/volador introducido en la primera generación. 
Es un Pokémon fósil.'),
('Snorlax', 143, 'normal', NULL, 'Snorlax', 'Snorlax es un Pokémon de tipo normal introducido en la primera generación. 
A partir de la cuarta generación, es la evolución de Munchlax.'),
('Articuno', 144, 'hielo', 'volador', 'Articuno', 'Articuno es un Pokémon legendario de tipo hielo/volador introducido en la primera generación. 
Pertenece al trío de aves legendarias.'),
('Zapdos', 145, 'electrico', 'volador', 'Zapdos', 'Zapdos es un Pokémon legendario de tipo eléctrico/volador introducido en la primera generación. 
Pertenece al trío de aves legendarias.'),
('Moltres', 146, 'fuego', 'volador', 'Moltres', 'Moltres es un Pokémon legendario de tipo fuego/volador introducido en la primera generación. 
Pertenece al trío de aves legendarias.'),
('Dratini', 147, 'dragon', NULL, 'Dratini', 'Dratini es un Pokémon de tipo dragón introducido en la primera generación.'),
('Dragonair', 148, 'dragon', NULL, 'Dragonair', 'Dragonair es un Pokémon de tipo dragón introducido en la primera generación. 
Es la evolución de Dratini.'),
('Dragonite', 149, 'dragon', 'volador', 'Dragonite', 'Dragonite es un Pokémon de tipo dragón/volador introducido en la primera generación. 
Es la evolución de Dragonair.'),
('Mewtwo', 150, 'psiquico', NULL, 'Mewtwo', 'Mewtwo es un Pokémon legendario y artificial de tipo psíquico introducido en la primera generación. 
Fue creado por el doctor Fuji a partir del ADN de Mew.'),
('Mew', 151, 'psiquico', NULL, 'Mew', 'Mew es un Pokémon singular de tipo psíquico introducido en la primera generación. 
Es el ancestro de todos los Pokémon, ya que tiene todos los genes de los Pokémon existentes. Además, es el único 
Pokémon capaz de aprender todas las máquinas técnicas (MT), máquinas ocultas (MO), discos técnicos (DT) y la mayoría de movimientos de tutor de movimientos.');