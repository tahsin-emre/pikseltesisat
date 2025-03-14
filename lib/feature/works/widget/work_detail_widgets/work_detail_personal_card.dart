part of '../../view/work_detail_view.dart';

final class _PersonalCard extends StatelessWidget {
  const _PersonalCard(this.personalNotifier);
  final ValueNotifier<Personal?> personalNotifier;
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: personalNotifier,
      builder: (_, personal, __) {
        return Card(child: _PersonalInfo(personal ?? const Personal(id: '')));
      },
    );
  }
}

final class _PersonalInfo extends StatelessWidget {
  const _PersonalInfo(this.personal);
  final Personal personal;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(personal.name ?? ''),
    );
  }
}
