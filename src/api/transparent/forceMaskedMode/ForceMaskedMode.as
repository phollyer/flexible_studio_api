package api.transparent.forceMaskedMode
{
	import api.events.transparent.forceMaskedMode.ForceMaskedModeEvent;

	import api.transparent.Transparent;

	import flash.events.IEventDispatcher;
	
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Transparent_forceMaskedMode.html Northcode Help Documentation
	*/
	public class ForceMaskedMode extends Transparent
	{
		// Required
		/**
		* 
		*
		* @defaultValue <code>true</code>
		*/
		public var flag:Boolean = true;
		
		/**
		* Constructor for Transparent.ForceMaskedMode()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Transparent_forceMaskedMode.html Northcode Help Documentation
		*/
		public function ForceMaskedMode(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Transparent_forceMaskedMode.html Northcode Help Documentation
		*/
		public function forceMaskedMode():void
		{
			ssCore.Transparent.forceMaskedMode( {flag:flag}
									  		   ,{callback:actionComplete, errorSTR:"forceMaskedModeError", code:"42001"} );
		}
	}
}