using System.Collections.Generic;


namespace RSSRetrieveService
{
    internal static class Extensions
    {
        public static IEnumerable<AngleSharp.Dom.IElement> GetDeepControlsByType<T>(this AngleSharp.Dom.IElement control)
        {
            foreach (var c in control.Children)
            {
                if (c is T)
                {
                    yield return c;
                }

                if (c.Children.Length > 0)
                {
                    foreach (var ctrl in c.GetDeepControlsByType<T>())
                    {
                        yield return ctrl;
                    }
                }
            }
        }

        public static string AppendLine(this string text)
        {
            return text + System.Environment.NewLine;
        }

        public static string NullIfEmpty(this string text)
        {
            var s = text?.Trim();
            return string.IsNullOrEmpty(s) ? null : s;
        }
        public static IEnumerable<IEnumerable<T>> Partition<T>(this IEnumerable<T> source, int size)
        {
            int i = 0;
            var list = new List<T>(size);
            foreach (T item in source)
            {
                list.Add(item);
                if (++i == size)
                {
                    yield return list;
                    list = new List<T>(size);
                    i = 0;
                }
            }
            if (list.Count > 0)
                yield return list;
        }
    }

}