import 'package:flutter/material.dart';
import 'inputpage.dart';
import 'plaininput.dart';
import 'secondScreen.dart';



class SelectionPage extends StatefulWidget {
  const SelectionPage({super.key});

  @override
  
  SelectionPageState createState() => SelectionPageState();
}

class SelectionPageState extends State<SelectionPage> {
  String _selectedOption = 'inputPage'; // Default selected option

  // Initialize controllers for InputPage
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();
  final TextEditingController _controller4 = TextEditingController();
  final TextEditingController _controller5 = TextEditingController();
  final TextEditingController _plainInputController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controllers when disposing
    _controller1.dispose();
    _controller2.dispose();
    _controller3.dispose();
    _controller4.dispose();
    _controller5.dispose();
    _plainInputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Select Input Format')),
      body: //Padding(
        //padding: const EdgeInsets.all(8.0),
       // child: 
        Column(
                children: [
              RadioListTile(
                title: const Text('Predefined Format (InputPage)'),
                value: 'inputPage',
                groupValue: _selectedOption,
                onChanged: (value) {
                  setState(() {
                    _selectedOption = value!;
                  });
                },
              ),
              RadioListTile(
                title: const Text('Custom Plain Text (PlainInputPage)'),
                value: 'plainInputPage',
                groupValue: _selectedOption,
                onChanged: (value) {
                  setState(() {
                    _selectedOption = value!;
                  });
                },
              ),
              const SizedBox(height: 16.0),
              
              // Conditionally display the selected input page
              if (_selectedOption == 'inputPage') ...[
                Expanded(
                  child: 
                InputPage(
                  controller1: _controller1,
                  controller2: _controller2,
                  controller3: _controller3,
                  controller4: _controller4,
                  controller5: _controller5,
                )
                )
              ] else if (_selectedOption == 'plainInputPage') ...[
                Expanded(
                  child: 
                PlainInputPage(controller: _plainInputController),)
              ],
              
              
        
          
              Padding(
                padding:const EdgeInsets.all(16.0), 
                child: ElevatedButton(
                  onPressed: () {
                    if (_selectedOption == 'inputPage') {
                      final inputPageData = {
                        'mouthAndPharynx': _controller1.text,
                        'upperEsophagus': _controller2.text,
                        'middleEsophagus': _controller3.text,
                        'lowerEsophagus': _controller4.text,
                        'stomachAndDuodenum': _controller5.text,
                      };
                          
                      // Navigate to SecondScreen with data from InputPage
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SecondScreen(
                            textFromPage1: inputPageData, typeOfText: _selectedOption,
                          ),
                        ),
                      );
                    } else if (_selectedOption == 'plainInputPage') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SecondScreen(
                            textFromPage2: _plainInputController.text,
                          ),
                        ),
                      );
                    }
                  },
                  child: const Text('Next')
                ),
              ),]
            ),
      //)
      );
    
  }
}
