package api.app.notifiers
{
	import flash.events.IEventDispatcher;
	
	import api.app.App;
	
	import api.events.app.notifiers.OnDialogEvent;
	
	/**
	 * Dispatched when the Results are ready.
	 *
	 * @eventType api.events.app.OnDialog.Event.RESULT
	 */
	/**
	 * Dispatched when the Results are ready.
	 *
	 * @eventType api.events.app.OnDialog.Event.RESULT
	 */
	[Event(name="result", type="api.events.app.onDialog.OnDialogEvent")]
	[Bindable]
	/**
	 *
	 *
	 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_App_notifiers.html Northcode Help Documentation
	 */
	/**
	 *
	 *
	 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_App_notifiers.html Northcode Help Documentation
	 */
	public class OnDialog extends App
	{
		// Results
		/**
		 * 
		 *
		 * @defaultValue <code>null</code>
		 */
		/**
		 * 
		 *
		 * @defaultValue <code>null</code>
		 */
		public var captionDialog:String = null;
		/**
		 * 
		 *
		 * @defaultValue <code>null</code>
		 */
		/**
		 * 
		 *
		 * @defaultValue <code>null</code>
		 */
		public var captionParent:String = null;
		/**
		 * 
		 *
		 * @defaultValue <code>null</code>
		 */
		/**
		 * 
		 *
		 * @defaultValue <code>null</code>
		 */
		public var hwndDialog:String = null;
		/**
		 * 
		 *
		 * @defaultValue <code>true</code>
		 */
		/**
		 * 
		 *
		 * @defaultValue <code>true</code>
		 */
		public var isChild:Boolean = true;
		
		/**
		 * Constructor for App.OnDialog()
		 *
                 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_App_notifiers.html Northcode Help Documentation
		 */
		/**
		 * Constructor for App.OnDialog()
		 *
                 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_App_notifiers.html Northcode Help Documentation
		 */
		public function OnDialog(target:IEventDispatcher=null)
		{
			super(target);
			ssCore.App.setNotify( {event:App.ON_DIALOG} , {callback:actionComplete, errorSTR:"onDialogError", code:"8028"} );
		}
		/**
		* A result has been received so dispatch it.
		*
		* @param r The result Object returned by SWF Studio.
		*
		* @private
		*/
		/**
		* A result has been received so dispatch it.
		*
		* @param r The result Object returned by SWF Studio.
		*
		* @private
		*/
		override protected function sendResult( r:Object ):void
		{
			var __a:Array = r.result.split( "," );
			captionDialog = __a[ 2 ];
			captionParent = __a[ 3 ];
			hwndDialog = __a[ 0 ];
			isChild = checkBoolean( __a[ 1 ] );
			
			var e : OnDialogEvent = new OnDialogEvent( OnDialogEvent.RESULT );
			e.captionDialog = captionDialog;
			e.captionParent = captionParent;
			e.hwndDialog = hwndDialog;
			e.isChild = isChild;
			dispatchEvent( e );
		}
		
	}
}