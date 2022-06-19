import 'dart:convert';
import 'package:demo_chat_app/models/video.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideosPage extends StatefulWidget {
  const VideosPage({Key? key}) : super(key: key);

  @override
  State<VideosPage> createState() => _VideosPageState();
}

class _VideosPageState extends State<VideosPage> {
  String part = 'video';
  String type = 'youtube';
  String term = 'mental health';
  final TextEditingController textEditingController = TextEditingController();

  List<Video> videos = <Video>[];

  getResults(String search) async {
    List<Video> vid = <Video>[];
// replace api key if videos don't load
    var url = Uri.parse(
        'https://www.googleapis.com/youtube/v3/search?type=video&q=$search&key=AIzaSyBtQEV6-TZYZi7BzUsMNu8P0kEVaLDy6Y8&part=snippet');

    var response = await http.get(url);
    // print(response);
    var data = jsonDecode(response.body);

    print("results: ${data["items"]}");

    for (var element in data["items"]) {
      // print("ele: ${element["id"]["videoId"]}");
      Video video = Video.fromMap(element);
      Video temp = Video(id: video.id, snippet: video.snippet);
      vid.add(temp);
      // print("element: ${temp.id}");
    }

// api key from vit edu account

    if (mounted) {
      setState(() {
        videos = vid;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getResults(term);
  }

  YoutubePlayerController getController(String id) {
    return YoutubePlayerController(
      initialVideoId: id,
      flags: const YoutubePlayerFlags(
          // hideThumbnail: true,
          autoPlay: false,
          mute: false,
          enableCaption: false),
    );
  }

  @override
  Widget build(BuildContext context) {
    // print(videos);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Feel Good Videos"),
      ),
      body: videos.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    // width: 200,
                    margin:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: TextFormField(
                      controller: textEditingController,
                      decoration: InputDecoration(
                          hintText: 'Search',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          contentPadding: const EdgeInsets.all(16)),
                      onFieldSubmitted: (String value) {
                        Future.delayed(const Duration(seconds: 2));
                        getResults(value);
                      },
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemCount: videos.length,
                    itemBuilder: (context, index) {
                      // print("builder: ${videos[index].id.videoId}");
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Column(
                          children: [
                            YoutubePlayer(
                              thumbnail: Image.network(
                                'https://img.youtube.com/vi/${videos[index].id.videoId}/0.jpg',
                                width: double.infinity,
                                height: double.infinity,
                                fit: BoxFit.fill,
                              ),
                              controller:
                                  // ytController,
                                  getController(videos[index].id.videoId),
                              progressIndicatorColor: Colors.blue,

                              // controller: YoutubePlayerController(
                              // initialVideoId: videos[index].id.videoId,
                              //   flags: const YoutubePlayerFlags(

                              //       // hideThumbnail: true,
                              //       autoPlay: false,
                              //       mute: false,
                              //       enableCaption: false),
                              // ),
                              showVideoProgressIndicator: true,
                            ),
                            ListTile(
                              title: Text(videos[index].snippet.title),
                              subtitle: Text(videos[index].snippet.description),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
    );
  }
}
