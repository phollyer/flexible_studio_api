package api.transparent.forceMaskedMode
{
	import api.events.transparent.forceMaskedMode.ForceMaskedModeEvent;

	import api.transparent.Transparent;

	import flash.events.IEventDispatcher;
	
	[Bindable]
	/**
	* When transparency is enabled, layered mode is automatically used if it is supported (see the Overview for details). This function allows you to override that behavior and force masked mode to be used instead.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Transparent_forceMaskedMode.html Northcode Help Documentation
	*/
	public class ForceMaskedMode extends Transparent
	{
		// Required
		/**
		* A boolean value that indicates whether transparency should be rendered using masks instead of layered window support. Valid values include: true and false.
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
		* When transparency is enabled, layered mode is automatically used if it is supported (see the Overview for details). This function allows you to override that behavior and force masked mode to be used instead.
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