import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

Router serverLogic() {
  final List<Map> data = [
    {
      "title": "Hippo Poaching Crisis in Uganda's National Parks",
      "image": "https://i.natgeofe.com/n/e04d819a-cb73-4e22-914a-c36302475ef8/naturepl_01238442.jpg?w=1534&h=1028",
      "published_at": "2024-10-01T10:00:00Z",
      "author": "John Doe",
      "story": "Hippo poaching has intensified in Uganda, with rangers reporting significant declines in their numbers. Conservationists are worried about the impact of poaching for hippo ivory."
    },
    {
      "title": "The Secret Lives of Leopards in the Serengeti",
      "image": "https://news.illinois.edu/files/6367/789160578/177353.jpg",
      "published_at": "2024-10-02T11:00:00Z",
      "author": "Jane Smith",
      "story": "New research reveals fascinating insights into the elusive behavior of leopards in the Serengeti, showcasing their hunting strategies and social interactions."
    },
    {
      "title": "Whales on the Move: Migration Patterns Uncovered",
      "image": "https://ychef.files.bbci.co.uk/1280x720/p0jqc48k.jpg",
      "published_at": "2024-10-03T09:30:00Z",
      "author": "Emma Brown",
      "story": "Scientists have tracked the migratory routes of humpback whales, revealing the incredible distances they travel between breeding and feeding grounds."
    },
    {
      "title": "Chameleons: Nature's Color-Changing Marvels",
      "image": "https://diapteron.co.uk/wp-content/uploads/2023/10/10-Fascinating-Facts-About-Chameleon-Colour-Changing7.jpg",
      "published_at": "2024-10-04T12:45:00Z",
      "author": "Michael Johnson",
      "story": "Chameleons are not just color changers; their vibrant hues communicate emotions, health, and even species identity, making them fascinating subjects for study."
    },
    {
      "title": "Elephant Families: The Heart of African Savannas",
      "image": "https://img.freepik.com/premium-photo/elephant-family-grazing-heart-jungle_198067-7894.jpg",
      "published_at": "2024-10-05T08:00:00Z",
      "author": "Sarah Davis",
      "story": "African elephants display remarkable family bonds, working together to protect their young and support one another in their search for food and water."
    },
    {
      "title": "The Mysterious Lives of Snow Leopards",
      "image": "https://c02.purpledshub.com/uploads/sites/62/2014/10/GettyImages-164854094-85c87f5.jpg?w=1029&webp=1",
      "published_at": "2024-10-06T15:30:00Z",
      "author": "David Wilson",
      "story": "Snow leopards are masters of camouflage, thriving in harsh mountain environments. New tracking technology is revealing their elusive behaviors."
    },
    {
      "title": "Coral Reefs: Underwater Cities of Biodiversity",
      "image": "https://www.aquariumofpacific.org/images/exhibits/sea_turtle_reef_KK_900.jpg",
      "published_at": "2024-10-07T14:00:00Z",
      "author": "Linda Thompson",
      "story": "Coral reefs support thousands of species and play a crucial role in marine ecosystems, but they face severe threats from climate change and pollution."
    },
    {
      "title": "Penguin Populations: Adapting to a Warming Climate",
      "image": "https://sbyireview.com/wp-content/uploads/2022/12/weddell_sea_beach_.jpg?w=1024",
      "published_at": "2024-10-08T10:30:00Z",
      "author": "Robert Martinez",
      "story": "As climate change alters their habitats, researchers are studying how penguins are adapting to rising temperatures and changing food availability."
    },
    {
      "title": "Red Pandas: The Conservation Challenge",
      "image": "https://stories.uq.edu.au/news/2022/red-pandas-face-a-fractured-future/assets/WbdKxO8j7C/adobestock_443569496-4096x2734.webp",
      "published_at": "2024-10-09T13:15:00Z",
      "author": "Angela Garcia",
      "story": "With only an estimated 2,500 individuals left in the wild, red pandas face critical habitat loss, prompting urgent conservation efforts."
    },
    {
      "title": "Giraffes: The Tallest Mammals at Risk",
      "image": "https://i.pinimg.com/736x/d2/af/a5/d2afa51af4d5f01303052d5de5d5ef58.jpg",
      "published_at": "2024-10-10T16:00:00Z",
      "author": "Paul Anderson",
      "story": "Giraffe populations have declined by nearly 40% over the past few decades, leading to a push for stronger conservation measures across Africa."
    },
    {
      "title": "Dolphins: Intelligent and Social Marine Mammals",
      "image": "https://media-cldnry.s-nbcnews.com/image/upload/t_fit-1500w,f_auto,q_auto:best/streams/2013/August/130812/6C8605933-130812-dolphinsphoto-hmed-0230p-files.jpg",
      "published_at": "2024-10-11T09:45:00Z",
      "author": "Karen Lee",
      "story": "Dolphins exhibit complex social behaviors, forming pods that demonstrate cooperation, communication, and emotional intelligence."
    },
    {
      "title": "The Amazing Migration of Monarch Butterflies",
      "image": "https://thinkbluemarble.com/wp-content/uploads/2023/07/butterflies.jpg",
      "published_at": "2024-10-12T11:30:00Z",
      "author": "James Robinson",
      "story": "Every year, millions of monarch butterflies migrate thousands of miles to escape the cold, relying on environmental cues and innate navigation skills."
    },
    {
      "title": "Sloths: Slow Movers with a Hidden World",
      "image": "https://images.theconversation.com/files/421291/original/file-20210915-23-ccdc2l.jpg?ixlib=rb-4.1.0&rect=9%2C765%2C5997%2C2998&q=45&auto=format&w=1356&h=668&fit=crop",
      "published_at": "2024-10-13T14:15:00Z",
      "author": "Emily White",
      "story": "Sloths may be slow, but their unique adaptations allow them to thrive in the treetops of Central and South American rainforests."
    },
    {
      "title": "Bison: The Great Plains Survivors",
      "image": "https://static.independent.co.uk/s3fs-public/thumbnails/image/2015/10/02/18/Bison-1.jpg?width=1200",
      "published_at": "2024-10-14T16:30:00Z",
      "author": "Thomas Harris",
      "story": "Once near extinction, bison are making a comeback in North America, thanks to conservation efforts that protect their grassland habitats."
    },
    {
      "title": "The Wonders of Bioluminescent Creatures",
      "image": "https://www.thoughtco.com/thmb/n4ejCUHwnBbBYPFU-UtsAZEKsj0=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/jellyfish-5b17e8baa9d4f90038c0a9c8.jpg",
      "published_at": "2024-10-15T08:00:00Z",
      "author": "Jessica Clark",
      "story": "From glowing jellyfish to sparkling fungi, bioluminescent organisms are captivating scientists and nature lovers alike with their enchanting displays."
    },
    {
      "title": "Koalas: Australia's Iconic Yet Vulnerable Species",
      "image": "https://www.echo.net.au/wp-content/uploads/2022/02/3.-Koala-in-rehabilitation-at-Friends-of-the-Koala-in-East-Lismore-NSW.-Photo-%C2%A9-IFAW.jpg",
      "published_at": "2024-10-16T10:45:00Z",
      "author": "Daniel Hall",
      "story": "Koalas face increasing threats from habitat loss and climate change, prompting urgent conservation actions to ensure their survival."
    },
    {
      "title": "Tigers: The Fight for Survival",
      "image": "https://eia-international.org/wp-content/uploads/bengal-tiger.jpg",
      "published_at": "2024-10-17T12:00:00Z",
      "author": "Patricia Lee",
      "story": "With only about 3,900 tigers left in the wild, conservationists are working tirelessly to protect their habitats and combat poaching."
    },
    {
      "title": "Oceans in Peril: The Plight of Sea Turtles",
      "image": "https://img.freepik.com/premium-photo/pollution-world-ocean-sea-turtle-swimming-dirty-water-water_143715-3454.jpg",
      "published_at": "2024-10-18T13:30:00Z",
      "author": "Mark Wilson",
      "story": "Sea turtles face numerous threats, including plastic pollution and habitat destruction, making their conservation critical for ocean health."
    }
  ];

  Response wildlifeHandler(Request request) {
    final json = jsonEncode(data);

    return Response.ok(
      json,
      headers: {
        "ContentType": "application/json"
      },
    );
  }

  final router = Router()..get('/wildlife', wildlifeHandler);

  return router;
}
