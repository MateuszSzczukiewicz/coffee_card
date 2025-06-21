import 'package:flutter_rpg/models/character.dart';
import 'package:flutter_rpg/models/vocations.dart';
import 'package:flutter_rpg/screens/create/vocation_card.dart';
import 'package:flutter_rpg/screens/home/home.dart';
import 'package:flutter_rpg/services/character_store.dart';
import 'package:flutter_rpg/shared/styled_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rpg/shared/styled_text.dart';
import 'package:flutter_rpg/theme.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

Uuid uuid = const Uuid();

class CreateScreen extends StatefulWidget {
  const CreateScreen({super.key});

  @override
  State<CreateScreen> createState() => _CreateState();
}

class _CreateState extends State<CreateScreen> {
  final _nameController = TextEditingController();
  final _sloganController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _sloganController.dispose();
    super.dispose();
  }

  Vocation selectedVocation = Vocation.junkie;

  void updateVocation(Vocation vocation) {
    setState(() {
      selectedVocation = vocation;
    });
  }

  void handleSubmit() {
    if (_nameController.text.trim().isEmpty) {
      showDialog<void>(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            title: const StyledHeading('Missing character name'),
            content: const StyledText(
              'Every good RPG character needs a great name...',
            ),
            actions: [
              StyledButton(
                onPressed: () {
                  Navigator.pop(ctx);
                },
                child: StyledHeading('close'),
              ),
            ],
            actionsAlignment: MainAxisAlignment.center,
          );
        },
      );

      return;
    }

    if (_sloganController.text.trim().isEmpty) {
      showDialog<void>(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            title: const StyledHeading('Missing slogan'),
            content: const StyledText('Remember to add a catchy slogan...'),
            actions: [
              StyledButton(
                onPressed: () {
                  Navigator.pop(ctx);
                },
                child: StyledHeading('close'),
              ),
            ],
            actionsAlignment: MainAxisAlignment.center,
          );
        },
      );

      return;
    }

    Provider.of<CharacterStore>(context, listen: false).addCharacter(
      Character(
        name: _nameController.text.trim(),
        slogan: _sloganController.text.trim(),
        vocation: selectedVocation,
        id: uuid.v4(),
      ),
    );

    Navigator.push(
      context,
      MaterialPageRoute<void>(builder: (ctx) => const Home()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const StyledText('Character Creation'),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(child: Icon(Icons.code, color: AppColors.primaryColor)),
              const Center(child: StyledHeading('Welcome, new player.')),
              const Center(
                child: StyledText(
                  'CreateScreen a name & slogan for your character.',
                ),
              ),
              const SizedBox(height: 30),

              TextField(
                controller: _nameController,
                style: GoogleFonts.kanit(
                  textStyle: Theme.of(context).textTheme.bodyMedium,
                ),
                cursorColor: AppColors.textColor,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.person_2),
                  label: StyledText('Character name'),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _sloganController,
                style: GoogleFonts.kanit(
                  textStyle: Theme.of(context).textTheme.bodyMedium,
                ),
                cursorColor: AppColors.textColor,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.chat),
                  label: StyledText('Character slogan'),
                ),
              ),
              const SizedBox(height: 30),

              Center(child: Icon(Icons.code, color: AppColors.primaryColor)),
              const Center(child: StyledHeading('Choose a vocation.')),
              const Center(
                child: StyledText('This determines your available skills.'),
              ),
              const SizedBox(height: 30),

              VocationCard(
                selected: selectedVocation == Vocation.junkie,
                onTap: updateVocation,
                vocation: Vocation.junkie,
              ),
              VocationCard(
                selected: selectedVocation == Vocation.ninja,
                onTap: updateVocation,
                vocation: Vocation.ninja,
              ),
              VocationCard(
                selected: selectedVocation == Vocation.raider,
                onTap: updateVocation,
                vocation: Vocation.raider,
              ),
              VocationCard(
                selected: selectedVocation == Vocation.wizard,
                onTap: updateVocation,
                vocation: Vocation.wizard,
              ),

              Center(child: Icon(Icons.code, color: AppColors.primaryColor)),
              const Center(child: StyledText('Good Luck.')),
              const Center(child: StyledText('And enjoy the journey...')),
              const SizedBox(height: 30),

              Center(
                child: StyledButton(
                  onPressed: handleSubmit,
                  child: const StyledHeading('CreateScreen Character'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
