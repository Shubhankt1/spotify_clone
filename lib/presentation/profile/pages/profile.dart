import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clone/common/helpers/is_dark_mode.dart';
import 'package:spotify_clone/common/widgets/appbar/app_bar.dart';
import 'package:spotify_clone/presentation/profile/bloc/profile_info_cubit.dart';
import 'package:spotify_clone/presentation/profile/bloc/profile_info_state.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        title: const Text(
          'Profile',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        backgroundColor:
            context.isDarkMode ? const Color(0xff2C2B2B) : Colors.white,
      ),
      body: Column(
        children: [_profileInfo(context)],
      ),
    );
  }

  Widget _profileInfo(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (_) => ProfileInfoCubit()..getUser(),
      child: SizedBox(
        height: height / 2.5,
        width: width,
        child: Container(
          decoration: BoxDecoration(
            color: context.isDarkMode ? const Color(0xff2C2B2B) : Colors.white,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50),
            ),
          ),
          child: BlocBuilder<ProfileInfoCubit, ProfileInfoState>(
            builder: (context, state) {
              if (state is ProfileInfoLoading) {
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              }

              if (state is ProfileInfoLoaded) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage(state.userEntity.imageUrl!),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(state.userEntity.email!),
                    const SizedBox(height: 15),
                    Text(
                      state.userEntity.fullName!.toUpperCase(),
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                );
              }
              if (state is ProfileInfoFailed) {
                return const Text('Please Try Again!');
              }
              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }
}
