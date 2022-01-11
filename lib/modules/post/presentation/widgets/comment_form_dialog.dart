import 'package:test_project/modules/post/presentation/presentation.dart';

class CommentFormDialog extends ConsumerStatefulWidget {
  const CommentFormDialog({Key? key, required this.postId}) : super(key: key);

  final int postId;

  @override
  ConsumerState<CommentFormDialog> createState() => _CommentFormDialogState();
}

class _CommentFormDialogState extends ConsumerState<CommentFormDialog> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final createCommentFormState =
        ref.watch(commentFormCubitProvider(widget.postId));
    final createCommentFormCubit =
        ref.read(commentFormCubitProvider(widget.postId).notifier);

    return Form(
      key: formKey,
      child: UWrappedPreloader(
        showPreloader: createCommentFormState is CommentFormStateLoading,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            UDialogTitle(context.localization.createComment),
            Row(
              children: [
                Flexible(
                  child: TextFormField(
                    controller: createCommentFormState
                        .commentEditingController.nameController,
                    decoration: UInputDecoration(
                      hintText: context.localization.name,
                    ),
                    validator: RequiredValidator(
                      errorText: context.localization.invalid('name'),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Flexible(
                  child: TextFormField(
                    controller: createCommentFormState
                        .commentEditingController.emailController,
                    decoration: UInputDecoration(
                      hintText: context.localization.email,
                    ),
                    validator: RequiredValidator(
                      errorText: context.localization.invalid('e-mail'),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: createCommentFormState
                  .commentEditingController.textController,
              decoration: UInputDecoration(
                hintText: context.localization.writeText,
              ),
              maxLines: 5,
              validator: RequiredValidator(
                errorText: context.localization.invalid('text'),
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
                      await createCommentFormCubit.sendComment(),
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
  }
}
