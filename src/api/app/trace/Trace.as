package api.app.trace
{
	import flash.events.IEventDispatcher;
	
	import api.app.App;
	
	[Bindable]
	/**
	 *
	 *
	 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_App_trace.html Northcode Help Documentation
	 */
	/**
	 *
	 *
	 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_App_trace.html Northcode Help Documentation
	 */
	public class Trace extends App
	{
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
		public var text:String = null;
		/**
		 * 
		 *
		 * @defaultValue <code>0</code>
		 */
		/**
		 * 
		 *
		 * @defaultValue <code>0</code>
		 */
		public var color:Number = 0;
		
		/**
		 * Constructor for App.Trace()
		 *
                 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_App_trace.html Northcode Help Documentation
		 */
		/**
		 * Constructor for App.Trace()
		 *
                 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_App_trace.html Northcode Help Documentation
		 */
		public function Trace(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		 *
		 *
                 *
		 * @param val
                 *
                 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_App_trace.html Northcode Help Documentation
		 */
		/**
		 *
		 *
                 *
		 * @param val
                 *
                 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_App_trace.html Northcode Help Documentation
		 */
		public function trace( val:String ):void
		{
			text = compareStrings( val , text );
                        switch( text )
                        {
                            case null:
                                missingText();
                                break;
                            default:
                                ssCore.App.trace( {text:text , color:color}, {callback:actionComplete, errorSTR:"traceError", code:"8004"} );
                        }
		}
	}
}