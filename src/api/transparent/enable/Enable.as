package api.transparent.enable
{
	import api.events.transparent.enable.EnableEvent;

	import api.transparent.Transparent;

	import flash.events.IEventDispatcher;
	
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Transparent_enable.html Northcode Help Documentation
	*/
	public class Enable extends Transparent
	{
		// Required
		/**
		* 
		*
		* @defaultValue <code>true</code>
		*/
		public var flag:Boolean = true;
		
		/**
		* Constructor for Transparent.Enable()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Transparent_enable.html Northcode Help Documentation
		*/
		public function Enable(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Transparent_enable.html Northcode Help Documentation
		*/
		public function enable():void
		{
			ssCore.Transparent.enable( {flag:flag}
									  ,{callback:actionComplete, errorSTR:"enableError", code:"42000"} );
		}
	}
}