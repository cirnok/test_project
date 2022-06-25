import 'package:test_project/modules/post/presentation/presentation.dart';

class CommentFormDialog extends StatefulWidget {
  const CommentFormDialog({Key? key, required this.postId}) : super(key: key);

  final int postId;

  @override
  State<CommentFormDialog> createState() => _CommentFormDialogState();
}

class _CommentFormDialogState extends State<CommentFormDialog> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return CommentFormViewModelProvider(
      widget.postId,
      child: BlocBuilder<CommentFormViewModel, CommentFormState>(
          builder: (context, state) {
        final viewModel = context.read<CommentFormViewModel>();
        return Form(
          key: formKey,
          child: UWrappedPreloader(
            showPreloader: state is CommentFormStateLoading,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                UDialogTitle(context.localization.createComment),
                TextFormField(
                  controller: state.commentEditingController.nameController,
                  decoration: UInputDecoration(
                    hintText: context.localization.name,
                  ),
                  validator: RequiredValidator(
                    errorText: context.localization.requiredInput,
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: state.commentEditingController.emailController,
                  decoration: UInputDecoration(
                    hintText: context.localization.email,
                  ),
                  validator: MultiValidator([
                    RequiredValidator(
                      errorText: context.localization.requiredInput,
                    ),
                    EmailValidator(
                      errorText: context.localization.invalidEmail,
                    ),
                  ]),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: state.commentEditingController.textController,
                  decoration: UInputDecoration(
                    hintText: context.localization.writeText,
                  ),
                  maxLines: 5,
                  validator: RequiredValidator(
                    errorText: context.localization.requiredInput,
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        Navigator.pop(
                          context,
                          await viewModel.sendComment(),
                        );
                      }
                    },
                    child: Text(context.localization.send),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
