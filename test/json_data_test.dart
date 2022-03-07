import 'package:flutter_test/flutter_test.dart';

import 'package:json_data/json_data.dart';

void main() {
  group('convertValue', () {
    test('simple values', () {
      expect(JsonData.convertValue('string'), '"string"');
      expect(JsonData.convertValue(3), 3);
      expect(JsonData.convertValue(true), true);
      expect(JsonData.convertValue(false), false);
      expect(JsonData.convertValue(null), null);
    });
    test('complex list values', () {
      expect(
          JsonData.convertValue([
            1,
            'string',
            [
              2,
              3,
              'other string',
              {'hello': 123}
            ],
            {'hello': 'word', 456: null}
          ]),
          [
            1,
            '"string"',
            [
              2,
              3,
              '"other string"',
              {'"hello"': 123}
            ],
            {'"hello"': '"word"', 456: null}
          ]);
    });

    test('complex map values', () {
      expect(
          JsonData.convertValue({
            'hello': 'word',
            456: null,
            'list': [
              1,
              2,
              'hello world',
              3,
              'random',
              {'google': 'play store', 'apple': 'app store'}
            ]
          }),
          {
            '"hello"': '"word"',
            456: null,
            '"list"': [
              1,
              2,
              '"hello world"',
              3,
              '"random"',
              {'"google"': '"play store"', '"apple"': '"app store"'}
            ]
          });
    });
  });
  group('toJson', () {
    test('simple map object', () {
      expect(JsonData.toJson({'hello': 'world'}), {'hello': 'world'});
    });
    test('complex map object', () {
      expect(
          JsonData.toJson({
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

  group('toJsonArray', () {
    test('simple map object', () {
      expect([
        {'hello': 'world'}
      ], [
        {'hello': 'world'}
      ]);
    });
    test('complex map object', () {
      expect([
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
      ], [
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

  group('fromJson', () {
    test('simple json', () {
      expect(JsonData.fromJson('{"hello": "world"}'), {'hello': 'world'});
    });
    test('complex json', () {
      expect(
          JsonData.fromJson(
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
  group('fromJsonArray', () {
    test('simple json array', () {
      expect(JsonData.fromJsonArray('[{"hello": "world"}]'), [
        {'hello': 'world'}
      ]);
    });
    test('complex json array', () {
      expect(
          JsonData.fromJsonArray(
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
