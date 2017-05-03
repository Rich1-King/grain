using System;
using System.Windows;
using System.Windows.Navigation;

namespace WpfApplication6.Controls
{
    public class SampleContainer : System.Windows.Controls.Page
    {                           // System.Windows.Controls.Page || UserControl

        public SampleContainer()
        {
            this.IsSampleLoaded = false;
            this.Loaded += OnSampleContainerLoaded;
            this.Unloaded += OnSampleContainerUnloaded;

            // code for WPF
            this.Initialized += OnSampleContainerInitialized;
        }

        public bool IsSampleLoaded { get; private set; }
      
        #region Events
        //System.Windows.RoutedEventArgs
     
        /// <summary>
        /// Occurs when the sample has been removed from the visual tree.
        /// </summary>
        public event EventHandler SampleUnloaded;
        //public event EventHandler SampleClosing;

        /// <summary>
        /// Occurs when the sample has been initialized.  
        /// </summary>
        public event EventHandler SampleInitialized;
        /// <summary>
        /// Occurs when the sample has been constructed and loaded to the visual tree.
        /// </summary>
        public event EventHandler SampleLoaded; 
        #endregion

        #region Event Handlers
        private void OnNavigationService_Navigating(object sender, NavigatingCancelEventArgs e)
        {
            if (e.NavigationMode == NavigationMode.New)
            {
                this.NavigationService.Navigating -= OnNavigationService_Navigating;

                this.OnNavigatingFrom(e);
            }
            
        }
        private void OnNavigationService_Navigated(object sender, NavigationEventArgs e)
        {

        }
        private void OnSampleContainerUnloaded(object sender, RoutedEventArgs e)
        {
            OnSampleUnloaded(EventArgs.Empty);
        }

        protected void OnSampleContainerLoaded(object sender, RoutedEventArgs e)
        {
            if (this.NavigationService != null)
            {
                this.NavigationService.Navigating += OnNavigationService_Navigating;
                this.NavigationService.Navigated += OnNavigationService_Navigated;               
            }
            OnSampleLoaded(EventArgs.Empty);
        }

        //private void OnSampleClosing(EventArgs e)
        //{
        //    if (SampleClosing != null)
        //        SampleClosing(this, e);
        //}

        protected void OnSampleUnloaded(EventArgs e)
        {
            this.IsSampleLoaded = false;
            if (SampleUnloaded != null)
                SampleUnloaded(this, e);
        }

        protected void OnSampleInitialized(EventArgs e)
        {
            if (SampleInitialized != null)
                SampleInitialized(this, e);
        }

        protected void OnSampleLoaded(EventArgs e)
        {
            this.IsSampleLoaded = true;
            if (SampleLoaded != null)
                SampleLoaded(this, e);
        }
        #endregion

        private void OnSampleContainerInitialized(object sender, EventArgs e)
        {
            OnSampleInitialized(EventArgs.Empty);
        }

        protected virtual void OnNavigatingFrom(NavigatingCancelEventArgs e)
        {
            OnSampleUnloaded(EventArgs.Empty);
           // OnSampleClosed(EventArgs.Empty);         
        }

        protected virtual void OnNavigatedTo(NavigationEventArgs e)
        {
            OnNavigationService_Navigated(this, e);
            OnSampleInitialized(EventArgs.Empty);
        }      
    }
}