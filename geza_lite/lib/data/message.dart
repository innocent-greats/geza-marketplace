class DemoMessage {
  final int id;
  final String type;
  final String name;
  final String text;
  final String time;

  const DemoMessage(
      {required this.id,
      required this.type,
      required this.name,
      required this.text,
      required this.time});
}

class MessageList {
  static List<DemoMessage> list() {
    const data = <DemoMessage>[
      DemoMessage(
          id: 1,
          text: 'hi',
          type: 'sender',
          name: 'Portia Chinhambo',
          time: '5.10 pm'),
      DemoMessage(
          id: 2, text: 'hello', type: 'receiver', time: '5.10 pm', name: ''),
      DemoMessage(
          id: 3,
          text: 'Hi! Sir we accept your request for your services.',
          type: 'sender',
          name: 'Portia Chinhambo',
          time: '5.20 pm'),
      DemoMessage(
          id: 4, text: 'Thanks', type: 'receiver', time: '5.20 pm', name: ''),
      DemoMessage(
          id: 5,
          text:
              'Hello! Yes I get invoice form your salon , I will come next day.',
          type: 'sender',
          name: 'Innocent Greats',
          time: '5.30 pm'),
      DemoMessage(
          id: 6,
          text: 'Thanks sir you have a good day ',
          type: 'receiver',
          time: '5.33 pm',
          name: ''),
      DemoMessage(
          id: 7,
          text: 'Come to here Again',
          type: 'sender',
          name: 'Portia Chinhambo',
          time: '5.45 pm'),
      DemoMessage(
          id: 8, text: 'Sure', type: 'receiver', time: '5.47 pm', name: ''),
    ];
    return data;
  }
}
