import 'package:flutter/material.dart';

class Character {
  final String name;
  final String imagePath;
  final String description;
  final List<Color> colors;

  Character({this.name, this.imagePath, this.description, this.colors});
}

List characters = [
  Character(
    name: "Kevin",
    imagePath: "assets/images/Kevin_minions.png",
    description:
        "Sir Kevin KBE (formerly known as Kevin) is one of the Minions and the protagonist in the film Minions. Kevin is a tall, two-eyed minion with sprout cut hair and is usually seen wearing his golf apparel. Kevin loves to make fun of and tease people or Minions, shown when he made fun of Jerry and teases him for being a coward. He loves playing golf and cricket. In the film Minions he is the leader of the trio in search of a new master. He truly cares about the well-being of the Minion tribe (which is dependent on them having a proper master).",
    colors: [Colors.orange.shade200, Colors.deepOrange.shade400]
  ),
  Character(
    name: "Agnes",
    imagePath: "assets/images/Agnes_gru.png",
    description:
    "Agnes Gru it is one of Gru and Lucy's three adopted daughters, alongside her sisters Margo and Edith. She is the youngest child of the three sisters. She greatly adores unicorns, as shown on various occasions. Agnes is a little girl with dark brown eyes. Her long black hair is tied in an upwards ponytail with a red scrunchie. Most of the time, Agnes wears blue overalls over a yellow and brown striped t-shirt, and white sneakers with yellow socks. She also wears a white ballet outfit like Edith and Margo (at the ballet recital). For pajamas, Agnes wears a long blue nightshirt covered with teddy bears and polar bear slippers; her hair stays the same. On her birthday, Agnes is wearing a dress that resembles a princess riding a unicorn. The colors are similar to her regular outfit. She also wears a blue princess hat on her head.",
      colors: [Colors.pink.shade200, Colors.redAccent.shade400]
  ),
  Character(
    name: "Stuart",
    imagePath: "assets/images/Stuart_minions.png",
    description:
    "Stuart is an one-eyed short Minion with combed hair. In Despicable Me 2, he is seen dressed up as a girl after Gru is recruited by the Anti-Villain League and sent to Bake My Day to investigate. Stuart is playful, friendly, intelligent and funny. He is skillful at video games like his friend Dave. He can also be the most sincere and innocent out of all the minions. He also seems to have a rebellious and obstreperous attitude. He is considered to be a slacker among the other Minions, preferring to chill out and play the ukulele than listen to the rules. Also, he was said to be always hungry in Minions, such as when he attempted to eat Kevin and Bob when he was thinking of them as bananas, and even tried to eat a yellow fire hydrant in New York, also thinking it as a banana or food as well.",
      colors: [Colors.orange.shade200, Colors.deepOrange.shade400]
  ),
  Character(
    name: "Margo",
    imagePath: "assets/images/Margo_Posing.png",
    description:
    "Margo Gru is one of Felonius Gru and Lucy Wilde's adopted daughters and the older sister to Edith and Agnes. She appears in Despicable Me, Despicable Me 2 and Despicable Me 3. Margo is the oldest of the three orphan girls that Gru adopts. Before she was adopted, she was an orphan horribly treated by Miss Hattie. Like Edith and Agnes (Margo's younger sisters), Margo wished to be adopted by somebody who would love them. She is very disapproving of Edith's mischief, shown where Edith jumps in puddles which gets her and Agnes wet, and also when she breaks a vial of acid in Gru's kitchen. She does join in with Edith's antics if it's against someone she doesn't like. She finds it very endearing when Agnes says innocent childlike things (although she does display mild irritation at Agnes' fixation with unicorns), the total opposite of Edith, who finds it irritating.",
      colors: [Colors.orange.shade200, Colors.brown.shade400]
  ),
  Character(
    name: "Bob",
    imagePath: "assets/images/bob_minion.png",
    description:
    "Bob (briefly known as King Bob) is one of the Minions, and one of the two deuteragonists of the film Minions. Bob is a short and bald minion with multi-colored eyes (green and brown). He often carries around a teddy bear that he owns called Tim, which is brown with yellow buttoned eyes. Bob is a minion who is more childish and immature than most of the other minions. He is described as a 'Little Brother' who finds love in anything and everything, including a rat (who he named Poochy) he found in a sewer in the Minions film. He also enjoys bedtime stories and playing with his favorite stuffed teddy bear, Tim.",
      colors: [Colors.orange.shade200, Colors.deepOrange.shade400]
  ),
  Character(
    name: "Gru",
    imagePath: "assets/images/Gru.png",
    description:
    "Felonius Gru is the main character of Despicable Me, Despicable Me 2, and Despicable Me 3, alongside Mel and a minor character in Minions. He is often referred to by his surname Gru, was formerly a supervillain and jelly manufacturer and a consultant for the Anti-Villain League. Born from the family with long line of villainy and formerly the world's greatest villain, Gru has been ousted by Vector, who had stolen the Pyramid of Giza and been bestowed the honor of pulling off the 'crime of the century'. In response, Gru unveils his plan for an even more impressive crime; the theft of the Moon. When his plans are interrupted by Vector, Gru becomes the adoptive father of three girls: Margo, Edith, and Agnes. Originally intending to use the trio as pawns for his scheme to steal the moon, Gru ends up warming up to the girls. After the Moon incident, Gru has become a stay-at-home dad and turned the Lab into a jelly manufacturing plant. He is brought out of retirement when the Anti-Villain League recruits him to find and stop the thief who stole the PX-41 mutagen. Together with AVL Agent Lucy Wilde, he attempts to track down the evasive El Macho. During the mission Lucy Wilde and Gru fall in love. They got married after El Macho was defeated.",
      colors: [Colors.grey.shade700, Colors.black]
  ),
];
