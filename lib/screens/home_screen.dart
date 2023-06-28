import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> horarios = [
    '08:30',
    '10:00',
    '10:30',
    '11:30',
    '13:00',
    '14:00',
    '14:30',
    '15:00',
    '17:30',
  ];

  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF6F6FB),
        centerTitle: true,
        elevation: 0,
        title: const Text(
          'Reagendamento',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 16,
              top: 36,
              bottom: 36,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Dr. João Silva',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Dermatologista',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.only(left: 16, bottom: 26),
            child: Text(
              'Selecione o horário da consulta',
              style: TextStyle(fontSize: 18),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 32),
              child: GridView.count(
                crossAxisCount: 3,
                childAspectRatio: 1.8,
                children: List.generate(horarios.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: selectedIndex == index
                            ? const Color(0xFF2E3352)
                            : Colors.white,
                        backgroundColor: selectedIndex == index
                            ? Colors.yellow
                            : const Color(0xFF2E3352),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14.0),
                        ),
                        elevation: selectedIndex == index ? 4 : 0,
                      ),
                      onPressed: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: Text(
                        horarios[index],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
          const Expanded(
            child: Align(
              alignment: Alignment.topCenter,
              child: Text(
                'Você está visualizando somente os horários que'
                ' esse profissional tem disponível para a data escolhida.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 32),
            width: 52,
            height: 52,
            decoration: const BoxDecoration(
              color: Color(0xFF2E3352),
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: const Icon(
                Icons.arrow_forward,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
