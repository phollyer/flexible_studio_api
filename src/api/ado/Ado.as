package api.ado
{
	import flash.events.IEventDispatcher;
	
	import api.Kernel;
	
	
	[Bindable]
	public class Ado extends Kernel
	{
		public function Ado(target:IEventDispatcher=null)
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
			
			var errorItem:Object = new Object();
			errorItem = e;
			errorItem.type = new String( errorSTR );
			errorItem.fullCode = new String( e.id + "-" + String( e.code ) );		
			ERROR_LOG.addItem( errorItem );
			
			var error:AdoError = new AdoError( errorSTR );
			errors.errorsItem = errorItem;
			errors.errorsLog = ERROR_LOG;
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