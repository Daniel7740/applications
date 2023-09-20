part of '../service_items_page.dart';

class ListOpenCloseBank extends StatelessWidget {
  const ListOpenCloseBank({
    super.key,
    required this.street,
    required this.typefiliation,
    this.state,
    required this.km,
  });

  final String street, typefiliation;
  final String? state;
  final int km;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.router.push(const FiliationRoute()),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  street,
                  style: AppTextStyles.style14w500
                      .copyWith(color: AppColors.onPrimary),
                ),
                const SizedBox(height: 10),
                Text(
                  typefiliation,
                  style: AppTextStyles.style12w500
                      .copyWith(color: AppColors.onPrimary),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(Icons.circle, color: Colors.red, size: 10),
                    const SizedBox(width: 10),
                    Text(
                      state!,
                      style: AppTextStyles.style12w300
                          .copyWith(color: AppColors.onPrimary),
                    ),
                    const SizedBox(width: 70),
                    Text(
                      "$km км",
                      style: AppTextStyles.style12w300
                          .copyWith(color: AppColors.onPrimary),
                    ),
                  ],
                ),
              ],
            ),
            AppImages.arrowRightBlack,
          ],
        ),
      ),
    );
  }
}
