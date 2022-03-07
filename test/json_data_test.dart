import 'package:flutter_test/flutter_test.dart';

import 'package:json_data/json_data.dart';

void main() {
  group('toJsonString', () {
    test('simple map object', () {
      expect(JsonData.toJsonString({'hello': 'world'}), '{"hello": "world"}');
    });
    test('complex map object', () {
      expect(
        JsonData.toJsonString({
          'hello': 'world',
          'list': [
            1,
            null,
            true,
            'flutter',
            false,
            [456, 654],
            {
              'deep-level': null,
              'deeper-level': {'hello': 'world'}
            }
          ]
        }),
        '{"hello": "world", "list": [1, null, true, "flutter", false, [456, 654], {"deep-level": null, "deeper-level": {"hello": "world"}}]}',
      );
    });
  });

  group('toJsonArrayString', () {
    test('simple list object', () {
      expect(
          JsonData.toJsonArrayString([
            {'hello': 'world'}
          ]),
          '[{"hello": "world"}]');
    });
    test('complex list object', () {
      expect(
        JsonData.toJsonArrayString([
          {
            'hello': 'world',
            'list': [
              1,
              null,
              true,
              'flutter',
              false,
              [456, 654],
              {
                'deep-level': null,
                'deeper-level': {'hello': 'world'}
              }
            ]
          }
        ]),
        '[{"hello": "world", "list": [1, null, true, "flutter", false, [456, 654], {"deep-level": null, "deeper-level": {"hello": "world"}}]}]',
      );
    });
  });

  group('fromJsonString', () {
    test('simple json', () {
      expect(JsonData.fromJsonString('{"hello": "world"}'), {'hello': 'world'});
    });
    test('complex json', () {
      expect(
          JsonData.fromJsonString(
              '{"hello": "world", "list": [1, null, true, "flutter", false, [456, 654], {"deep-level": null, "deeper-level": {"hello": "world"}}]}'),
          {
            'hello': 'world',
            'list': [
              1,
              null,
              true,
              'flutter',
              false,
              [456, 654],
              {
                'deep-level': null,
                'deeper-level': {'hello': 'world'}
              }
            ]
          });
    });
  });
  group('fromJsonArrayString', () {
    test('simple json array', () {
      expect(JsonData.fromJsonArrayString('[{"hello": "world"}]'), [
        {'hello': 'world'}
      ]);
    });
    test('complex json array', () {
      expect(
          JsonData.fromJsonArrayString(
              '[{"hello": "world", "list": [1, null, true, "flutter", false, [456, 654], {"deep-level": null, "deeper-level": {"hello": "world"}}]}]'),
          [
            {
              'hello': 'world',
              'list': [
                1,
                null,
                true,
                'flutter',
                false,
                [456, 654],
                {
                  'deep-level': null,
                  'deeper-level': {'hello': 'world'}
                }
              ]
            }
          ]);
    });
  });
}
