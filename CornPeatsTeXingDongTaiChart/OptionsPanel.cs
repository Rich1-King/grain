using System.Diagnostics;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Controls.Primitives;
using System.Windows.Input;
using System.Windows.Media;
using System;
namespace CornPeatsTeXingDongTaiChart
{
    /// <summary>
    /// Represents a panel control that can be drag within its parent control's boundaries. 
    /// <para>This control is used in samples that provide options/controls for interacting with IG controls. </para>
    /// </summary>
    public class OptionsPanel : ItemsControl
    {
        ScrollViewer _scrollContent;
        public OptionsPanel()
        {
            // TODO: load default styles in themes\generic.xaml
            string stylePath = "/CornPeatsTeXingDongTaiChart;component/OptionsPanel.xaml";

            base.DefaultStyleKey = typeof(OptionsPanel);
            //this.VerticalAlignment = VerticalAlignment.Top;
            //this.HorizontalAlignment = HorizontalAlignment.Left;
            this.IsMovable = true;

            //Canvas.SetZIndex(this, 100);
           
            this.Loaded += OnOptionsPanelLoaded;

            // Add the default style to the control's resources
            var style = new ResourceDictionary();
            style.Source = new System.Uri(stylePath, System.UriKind.Relative);
            this.Resources.MergedDictionaries.Add(style);
        }

        void parent_LayoutUpdated(object sender, System.EventArgs e)
        {         
            CalculateMargins();
            if (tTranslate.X > _maxMarginLeft)
                tTranslate.X = _maxMarginLeft;
            if (tTranslate.Y > _maxMarginTop)
                tTranslate.Y = _maxMarginTop;
        }

        void OnOptionsPanelLoaded(object sender, RoutedEventArgs e)
        {
            try
            {
                var parent = this.Parent as FrameworkElement;              
                parent.LayoutUpdated += new System.EventHandler(parent_LayoutUpdated);

                this.UpdateLayout();
                if (VisualTreeHelper.GetChildrenCount(this) > 0)
                {
                    var rootElement = VisualTreeHelper.GetChild(this, 0) as Border;
                    if (rootElement != null)
                    {
                        var winHandle = rootElement.FindName("optPanel") as Border;
                        var btnState = rootElement.FindName("btnState") as ToggleButton;
                        _scrollContent = rootElement.FindName("scrollContent") as ScrollViewer;

                        if (winHandle != null)
                        {
                            winHandle.MouseMove += OnWinHandleMouseMove;
                            winHandle.MouseLeftButtonDown += OnWinHandleMouseLeftButtonDown;
                            winHandle.MouseLeftButtonUp += OnWinHandleMouseLeftButtonUp;
                            winHandle.MouseRightButtonDown += OnWinHandleMouseRightButtonDown;
                            winHandle.MouseRightButtonUp += OnWinHandleMouseRightButtonUp;
                            winHandle.MouseLeave += OnWinHandleMouseLeave;
                        }

                        if (btnState != null) btnState.Click += OnBtnStateClick;
                    }
                }

                this.LayoutUpdated += OnOptionsPanelLayoutUpdated;
                
                if (IsMovable)
                    SetTransform();

            }
            catch (System.Exception ex)
            {
                Debug.WriteLine("OptionsPanel Loading Error: " + ex.Message);
            }
        }
        
        private void SetTransform()
        {
            if (this.Parent as FrameworkElement != null)
            {
                GeneralTransform objGeneralTransform = this.TransformToVisual(this.Parent as FrameworkElement);
                Point point = objGeneralTransform.Transform(new Point(0, 0));
                tTranslate.X = point.X;
                tTranslate.Y = point.Y;
                this.Margin = new Thickness(0);
                this.VerticalAlignment = VerticalAlignment.Top;
                this.HorizontalAlignment = HorizontalAlignment.Left;
                this.RenderTransform = tTranslate;
            }
        }

        private bool _recalculateMargins = true;
        void OnOptionsPanelLayoutUpdated(object sender, System.EventArgs e)
        {
            if (_recalculateMargins)
            {
                CalculateMargins();
                Move(this.tTranslate.X, this.tTranslate.Y);
                _recalculateMargins = false;
            }
        }


        void OnBtnStateClick(object sender, RoutedEventArgs e)
        {
            var btnState = (ToggleButton)sender;
          
            if (btnState.IsChecked != null)
            {
                _scrollContent.Visibility = btnState.IsChecked.Value ? Visibility.Visible : Visibility.Collapsed;
                if (btnState.IsChecked.Value) _recalculateMargins = true;
                btnState.Content = btnState.IsChecked.Value ? "-" : "+";
            }
        }

        #region Moving
        TranslateTransform tTranslate = new TranslateTransform();
        Point _borderPosition;
        Point _currentPosition;
        double _maxMarginLeft;
        double _maxMarginTop;
        bool _dragOn = false;
        private void OnWinHandleMouseRightButtonDown(object sender, MouseButtonEventArgs e)
        {
            this.Opacity = 0.0;
        }
        private void OnWinHandleMouseRightButtonUp(object sender, MouseButtonEventArgs e)
        {
            this.Opacity = 1.0;
        }
        private void OnWinHandleMouseLeave(object sender, MouseEventArgs e)
        {
            this.Opacity = 1.0;
        }

        private void OnWinHandleMouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {
            if (!this.IsMovable) return;

            var c = sender as FrameworkElement;
            _dragOn = true;
            this.Opacity *= 0.5;
            _borderPosition = e.GetPosition(sender as Border);

            CalculateMargins();

            if (c != null) c.CaptureMouse();
        }

        private void CalculateMargins()
        {
            var parent = (this.Parent as FrameworkElement);
            if (parent != null)
            {
                //TODO: offset by control's Margin
                _maxMarginLeft = parent.ActualWidth - this.ActualWidth;
                _maxMarginTop = parent.ActualHeight - this.ActualHeight;
            }
        }

        private void OnWinHandleMouseLeftButtonUp(object sender, MouseButtonEventArgs e)
        {
            if (_dragOn)
            {
                var c = sender as FrameworkElement;
                this.Opacity = 1;
                if (c != null) c.ReleaseMouseCapture();
                _dragOn = false;
            }
        }

        private void OnWinHandleMouseMove(object sender, MouseEventArgs e)
        {
            if (_dragOn)
            {
                _currentPosition = e.GetPosition(sender as Border);
                var x = tTranslate.X + _currentPosition.X - _borderPosition.X;
                var y = tTranslate.Y + _currentPosition.Y - _borderPosition.Y;

                Move(x, y);
            }
        }

        private void Move(double x, double y)
        {
            if (x < 0)
                x = 0;
            if (y < 0)
                y = 0;
            if (x > _maxMarginLeft)
                x = _maxMarginLeft;
            if (y > _maxMarginTop)
                y = _maxMarginTop;
            tTranslate.X = x;
            tTranslate.Y = y;
        }
        #endregion

        #region Dependency Properties

        public static DependencyProperty HeaderTextProperty = DependencyProperty.Register(
         "HeaderText", typeof(string), typeof(OptionsPanel), null);

        /// <summary>
        /// Gets or sets Header Text of the OptionsPanel
        /// </summary>
        public string HeaderText
        {
            get { return (string)GetValue(HeaderTextProperty); }
            set { SetValue(HeaderTextProperty, value); }
        }

        public static DependencyProperty IsMovableProperty = DependencyProperty.Register(
         "IsMovable", typeof(bool), typeof(OptionsPanel), null);

        /// <summary>
        /// Gets or sets whether the OptionsPanel can be movable within its parent control's boundaries.  
        /// </summary>
        public bool IsMovable
        {
            get
            {
                return (bool)GetValue(IsMovableProperty);
            }
            set
            {
                SetValue(IsMovableProperty, value);
                if (value)
                    SetTransform();
            }
        }

        #endregion

    }
}
