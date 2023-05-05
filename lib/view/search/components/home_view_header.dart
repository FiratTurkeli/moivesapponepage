part of home_view;


class HomeViewHeader extends StatefulWidget {
  List<Movies> allMovies;
  HomeViewHeader({Key? key , required this.allMovies}) : super(key: key);

  @override
  State<HomeViewHeader> createState() => _HomeViewHeaderState();
}

class _HomeViewHeaderState extends State<HomeViewHeader> {
  TextEditingController _textEditingController = TextEditingController();
  List<Movies> movies = [];
  var formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidate = AutovalidateMode.disabled;


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        searchContainer(),
           Container(
             height: MediaQuery.of(context).size.height*0.6,
             margin: const EdgeInsets.fromLTRB(10, 10, 10, 5),
            color: Colors.transparent,
              child: ListView.builder(
                itemExtent: 60,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: _textEditingController.text.isEmpty ? widget.allMovies.length : movies.length,
                itemBuilder: (context,index){
                  return ListTile(
                   leading: circleAvatar(_textEditingController.text.isEmpty ? "${widget.allMovies[index].posterPath}" : "${movies[index].posterPath}"),
                   title: buildTitleWidget(_textEditingController.text.isEmpty ? "${widget.allMovies[index].originalTitle}" : "${movies[index].originalTitle}" )


                 );
                }
            ),
           )
      ],
    );
  }



  Widget circleAvatar(String image){
    return CircleAvatar(
      backgroundImage: NetworkImage('https://image.tmdb.org/t/p/w220_and_h330_face${image}'),
    );}



  Widget buildTitleWidget(String title){
    return Text(title , style: const TextStyle(color:black , fontWeight: FontWeight.bold, fontSize: 18),);
  }



  Widget searchContainer(){
    return Container(
        color: primaryLight,
        margin: const EdgeInsets.fromLTRB(20, 10, 20, 5),
        child: Form(
          key: formKey,
          autovalidateMode: autoValidate,
          child: TextFormField(
            validator: (value){
              return value!.length < 2 ? 'Name must be greater than two characters' : null;
            },


            controller: _textEditingController,
            style: const TextStyle(color: black),
            textInputAction: TextInputAction.done,
            //controller: ,
            cursorColor: black,
            decoration: const InputDecoration(
                contentPadding:  EdgeInsets.symmetric(vertical: 15,),
                border: InputBorder.none,
                hintText: "Search Movie",
                hintStyle: TextStyle(color: primary),
                prefixIcon: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 15),
                    child: Icon(Icons.manage_search, color: primaryDark,)
                )
            ),
            onChanged: searchCompany,
          ),
        )
    );
  }

   void searchCompany(String query){
    final suggestions = widget.allMovies.where((company){
      final companyTitle = company.originalTitle?.toLowerCase();
      final input = query.toLowerCase();
      input.length <=2 ? autoValidate = AutovalidateMode.always : autoValidate = AutovalidateMode.disabled;
      return input.length < 2 ? false :companyTitle!.contains(input) ;

    }
    ).toList();
    if (query.isEmpty ) {
      setState((){
        movies = widget.allMovies;
      });
    } else {
      setState((){
        movies = suggestions;

      });
    }

   }
}
