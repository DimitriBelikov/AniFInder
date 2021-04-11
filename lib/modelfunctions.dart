import 'dart:io';

//import 'package:firebase_ml_custom/firebase_ml_custom.dart';
import 'package:tflite/tflite.dart';

// Future<File> getModel() async {
//   late File modelFile;
//
//   FirebaseCustomRemoteModel remoteModel =
//       FirebaseCustomRemoteModel('AniFinderModel');
//
//   FirebaseModelDownloadConditions conditions =
//       FirebaseModelDownloadConditions();
//   print('Starting Download');
//   FirebaseModelManager modelManager = FirebaseModelManager.instance;
//   await modelManager.download(remoteModel, conditions);
//   print('Ended Download');
//   if (await modelManager.isModelDownloaded(remoteModel) == true) {
//     print('Model Downloaded and Loaded');
//     modelFile = await modelManager.getLatestModelFile(remoteModel);
//   } else
//     print('Downloading Model......');
//   return modelFile;
// }

loadModel() async {
  //File modelFile = await getModel();
  //print(modelFile.path);

  String resModel = await Tflite.loadModel(
    model: "assets/anifinder_model.tflite",
    labels: "assets/labels.txt",
    numThreads: 1,
    isAsset: true,
  );
  print('Model Loaded');
}

Future runModel(File image) async {
  await loadModel();
  var output = await Tflite.runModelOnImage(
      path: image.path,
      imageMean: 127.5,
      imageStd: 127.5,
      threshold: 0.1,
      numResults: 10,
      asynch: false);
  return output;
}

class ModelLabels {
  Map _animalData = {
    'butterfly': 'Butterflies are known for their beautiful colors and unique '
        'patterns. Butterflies are insects, which means that they have six legs, '
        'a set of antennae, and three parts to their body. Adult butterflies have '
        'large wings with different colored patterns. Butterflies can be found '
        'all over the world, except in Antarctica, and there are close to 19,000 '
        'different types.',
    'cat': 'Cats are one of, if not the most, popular pet in the world. Cats and '
        'humans have been associated for nearly 10000 years. Cats conserve energy '
        'by sleeping for an average of 13 to14 hours a day. Cats have flexible '
        'bodies and teeth adapted for hunting small animals such as mice and rats.'
        'Domestic cats usually weigh around 4 to 5 kilograms. Cats can be lethal '
        'hunters and very sneaky and Cats also have excellent hearing and a powerful sense of smell.',
    'chicken': 'A chicken is a kind of domesticated bird. It is raised widely for '
        'its meat and eggs. They are usually kept by humans as livestock, which '
        'means it is kept for its meat and eggs. A male chicken is called a rooster '
        'or a cock. A female chicken is called a hen. A young chicken is called '
        'a chick. Like other female birds, hens lay eggs which can hatch into chicks.',
    'cow': 'Cows are one of the most popular domesticated animals in many '
        'countries around the world. They bring several benefits to those that have them. There are over 1000 different breeds of cattle in the world. '
        'Baby cows are called calves, the adult female is called a cow and the '
        'adult male is called a bull. They like to eat plants and grassIndia is '
        'home to over 300 million cows. They are colorblind to red and green colors.',
    'dog': 'Dogs have been loyal and useful companions to humans through the ages, '
        'providing physical and emotional security as loving pets. '
        'Dogs are quite useful as they carry out farm work, provide security, hunt, '
        'and even play guides to the visually-impaired. They are wonderful companions '
        'for children and the elderly, due to their ability to give care and '
        'unflinching love. Dogs have a terrific sense of hearing as compared to '
        'humans and can hear sounds at four times the distance.',
    'elephant': 'Elephants are the world’s largest mammals living on land. The '
        'African Elephant and the Asian Elephant are the two types of elephants.'
        'The elephant’s trunk is entirely made up of about 100,000 muscles and no '
        'bones. The elephant uses its trunk to know the size, shape, and '
        'temperature of objects. It is used to suck in water or pick up food and '
        'put it into its mouth. An adult elephant needs to drink more than 200 '
        'litres of water every day and it uses its tusks to dig the earth for this '
        'purpose. Elephants use their trunks to breathe when they swim in deep waters.',
    'horse': 'Horses are four legged animals that have had a long relationship with '
        'humans. They were once a major form of transportation for humans. '
        'They also performed many jobs for humans over the years. There are '
        'over 300 different breeds of horses. Horse breeds come in a number '
        'of different sizes, colors, and skill sets. There are three main '
        'types of horse breeds: Hot bloods are fast horses bred for speed and '
        'racing. Horses are grazing animals and mostly eat hay and grasses. They '
        'also like legumes like peas and beans, fruit such as apples, and even carrots',
    'sheep': 'Sheep are among the most valuable of all domestic animals. Domestic '
        'animals are ones that have been tamed for use by humans. People eat '
        'sheep meat and drink sheep milk. The wool is used to make cloth. Sheep are '
        'closely related to goats. There are more than 200 breeds of sheep. They '
        'are found on every continent except Antarctica. Sheep can be either wild '
        'or domestic. Most sheep like to live in high and dry areas.',
    'squirrel': 'With over 200 species of squirrels around the world, they share '
        'the common traits of smart enough to figure out a lot of ways to get their '
        'food. Some people consider them pests, while others adore them. Squirrels '
        'belong to the family of mammal rodents. Many people don’t know that there '
        'are actually three types of squirrels: ground squirrels, tree squirrels, '
        'and flying squirrels. Squirrels live in places depending upon the type: '
        'most live in trees and some burrow into the ground and other types will '
        'remain in their burrows to hibernate in the cold months.',
    'tiger': 'Tigers can grow up to a length of 11 feet and weigh up to 300 kilograms '
        'when fully developed. Tigers belong to the cat family and are the biggest '
        'of their species. Tigers are excellent swimmers and capable of swimming '
        'up to six kilometres at a stretch. Tigers are lone hunters and generally '
        'hunt at night, taking advantage of the dark and their strong night vision. '
        'Tigers can reach a maximum speed of 65 km/ h while chasing a meal for the '
        'family. Similarly, tigers can jump over 5 metres during hunts.'
  };

  String getAnimalInfo(String species) {
    return _animalData[species.toLowerCase()];
  }
}
