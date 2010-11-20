package api.browser
{
	import flash.events.IEventDispatcher;
	
	import api.Kernel;
	
	
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Browser.html Northcode Help Documentation
	*/
	public class Browser extends Kernel
	{
		public static const IE:String = "IE";
		public static const MOZILLA:String = "MOZILLA";
		public static const ON_ACTIVE_ELEMENT_CHANGE:String = "onActiveElementChange";
		public static const ON_BLOCKED_POP_UP:String = "onBlockedPopUp";
		public static const ON_BLOCKED_URL:String = "onBlockedURL";
		public static const ON_DOCUMENT_COMPLETE:String = "onDocumentComplete";
		public static const ON_NAVIGATE:String = "onNavigate";
		public static const ON_PREVIEW:String = "onPreview";
		public static const ON_PROGRESS:String = "onProgress";
		public static const ON_STATUS:String = "onStatus";
		public static const ON_TITLE:String = "onTitle";
		
		/**
		* Constructor for Browser()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Browser.html Northcode Help Documentation
		*/
		public function Browser(target:IEventDispatcher=null)
		{
			super(target);
		}
		
		/**
		 * An Error has occured so package Error
		 * Data and send out the data
		 */
		override public function dispatchError( errorSTR:String , e:Object ):void
		{
			super.dispatchError( errorSTR , e );
			var error:BrowserError = new BrowserError( errorSTR );
			errors.code = e.id + "-" + e.code;
			errors.summary = e.description;
			errors.command = e.command;
			errors.description = null;
			dispatchEvent( error );
		}
		
		/**
		* This method should be called when a SWF Studio action
		* has completed successfully.
		*
		* <p>This method should be overridden by sub classes in
		* order to dispatch Class specific data</p>
		*
		* @param r The result Object returned by SWF Studio.
		*
		* @private
		*/
		override protected function sendResult(r:Object):void
		{
		}
	}
}