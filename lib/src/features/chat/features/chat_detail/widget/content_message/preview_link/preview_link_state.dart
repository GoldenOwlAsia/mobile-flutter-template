// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'preview_link_bloc.dart';

class PreviewLinkState extends Equatable {
  final String url;
  final bool loading;
  PreviewLinkData? get link => metaDataLink[url];

  static final Map<String, PreviewLinkData> metaDataLink = {};

  const PreviewLinkState({
    required this.url,
    this.loading = true,
  });

  factory PreviewLinkState.ds(String url) {
    final link = metaDataLink[url];
    return PreviewLinkState(url: url, loading: link != null ? false : true);
  }

  @override
  List<Object?> get props => [link, url, loading];

  PreviewLinkState copyWith({
    bool? loading,
  }) {
    return PreviewLinkState(
      url: url,
      loading: loading ?? this.loading,
    );
  }
}
